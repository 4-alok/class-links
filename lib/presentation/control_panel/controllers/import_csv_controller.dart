import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../global/models/time_table/time_table.dart';
import 'get_csv_file.dart';

class ImportCsvController with GetFile {
  final field = RxList<List>([]);
  final day = Rx<String?>(null);
  final batch = Rx<String?>(null);
  final year = Rx<int?>(null);
  final slot = Rx<int?>(null);
  final r1 = Rx<String?>(null);
  final r2 = Rx<String?>(null);
  final r3 = Rx<String?>(null);
  final creatorId = Rx<String?>(null);
  final count = Rx<int?>(null);

  // List<Day> get _defaultDays => List.generate(
  //       7,
  //       (index) => Day(day: Days.days[index], subjects: []),
  //     );

  int get batchColIndex => field.first.indexWhere((e) => e == batch.value);

  int get _dayColIndex => field.first.indexWhere((e) => e == day.value);

  int get _room1Index => field.first.indexWhere((e) => e == r1.value);

  int get _room2Index => field.first.indexWhere((e) => e == r2.value);

  int get _room3Index => field.first.indexWhere((e) => e == r3.value);

  List get subjectTimes => field.first.where((e) {
        try {
          return (e as String).startsWith('t-') ? true : false;
        } catch (e) {
          rethrow;
        }
      }).toList();

  List<Subject> getSubjects(List row) {
    final subjectList = List.generate(
      subjectTimes.length,
      (index) {
        final time =
            int.parse((subjectTimes[index] as String).split('t-').last);

        final subIndex =
            field.first.indexWhere((e) => e == subjectTimes[index]);

        String roomNo;

        if (r3.value != null) {
          if (subIndex > _room3Index) {
            roomNo = row[_room3Index];
          } else if (subIndex > _room2Index) {
            roomNo = row[_room2Index];
          } else {
            roomNo = row[_room1Index];
          }
        } else {
          roomNo = subIndex > _room2Index ? row[_room2Index] : row[_room1Index];
        }

        return Subject(
          subjectName: row[subIndex],
          startTime: DayTime(hour: time, minute: 0),
          roomNo: roomNo.toLowerCase() == 'x' ? null : roomNo,
        );
      },
    );

    subjectList.removeWhere((e) => e.subjectName.toLowerCase() == 'x');
    return subjectList;
  }

  TimeTable _generateTimetable(int index) => TimeTable(
        week: [
          Day(
              day: field[index][_dayColIndex],
              subjects: getSubjects(field[index]))
        ],
        batch: field[index][batchColIndex],
        year: year.value ?? 2020,
        creatorId: '2005847@kiit.ac.in',
        date: DateTime.now(),
        slot: slot.value ?? 1,
      );

  List<TimeTable> _patch(List<TimeTable> timetables) {
    List<TimeTable> t = timetables;
    t = timetables
        .map((e) => e.copyWith(
              week: [
                ...e.week,
                const Day(day: 'Saturday', subjects: []),
                const Day(day: 'Sunday', subjects: []),
              ],
            ))
        .toList();
    return t;
  }

  Future<List<TimeTable>> get getTimeTables async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<TimeTable> _timeTables = [];

    for (int i = 0; i < field.length; i++) {
      final containBatch = _timeTables
          .where((e) => e.batch == field[i][batchColIndex])
          .isNotEmpty;
      if (i != 0) {
        if (!containBatch) {
          _timeTables.add(_generateTimetable(i));
        } else {
          final index =
              _timeTables.indexWhere((e) => e.batch == field[i][batchColIndex]);
          final t = _timeTables[index];
          _timeTables[index] = t.copyWith(
            week: [
              ...t.week,
              Day(day: field[i][_dayColIndex], subjects: getSubjects(field[i]))
            ],
          );
        }
      }
    }
    _timeTables = _patch(_timeTables);

    return _timeTables;
  }

  void get printTimetable async {
    List<TimeTable> timetables = await getTimeTables;
    if (kDebugMode) {
      for (var e in timetables) {
        print(e.batch);
        // ignore: avoid_function_literals_in_foreach_calls
        (e.week.forEach((e) {
          if (kDebugMode) {
            print(e.day);
            print(e.subjects
                .map((e) => "${e.subjectName}|${e.roomNo}|${e.startTime.hour}")
                .toList());
          }
        }));
        print("\n\n");
      }
    }
  }

  Future<void> get import async {
    List<TimeTable> timetables = await getTimeTables;
    for (int i = 0; i < timetables.length; i++) {
      await Get.find<FirestoreService>().timetableDatasource.addTimeTable(
            timetables[i],
          );
      count.value = i;
    }
    count.value = null;
  }

  Future<void> get selectFile async => field.value = await getFileData;

  void get dispose {
    field.close();
    day.close();
    batch.close();
    year.close();
    slot.close();
    r1.close();
    r2.close();
    r3.close();
    creatorId.close();
    count.close();
  }
}
