import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:file_picker/file_picker.dart';

import '../../../global/const/const.dart';
import '../../../models/time_table/time_table.dart';

class ImportController extends GetxController {
  final field = RxList<List>([]);
  final day = Rx<String?>(null);
  final batch = Rx<String?>(null);
  final year = Rx<int?>(null);
  final slot = Rx<int?>(null);
  final creatorId = Rx<String?>(null);

  List<Day> get defaultDays => List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );

  int get batchColIndex => field.first.indexWhere((e) => e == batch.value);

  int get dayColIndex => field.first.indexWhere((e) => e == day.value);

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

        return Subject(
          subjectName: row[subIndex],
          startTime: DayTime(hour: time, minute: 0),
        );
      },
    );

    subjectList.removeWhere((e) => e.subjectName == 'x');
    return subjectList;
  }

  TimeTable generateTimetable(int index) => TimeTable(
        week: [
          Day(
              day: field[index][dayColIndex],
              subjects: getSubjects(field[index]))
        ],
        batch: field[index][batchColIndex],
        year: year.value ?? 2020,
        creatorId: '2005847@kiit.ac.in',
        date: DateTime.now(),
        slot: slot.value ?? 1,
      );

  List<TimeTable> patch(List<TimeTable> timetables) {
    for (TimeTable timetable in timetables) {
      timetable.week.addAll([
        const Day(day: 'Saturday', subjects: []),
        const Day(day: 'Sunday', subjects: []),
      ]);
    }
    return timetables;
  }

  Future<void> get getTimeTables async {
    List<TimeTable> _timeTables = [];

    for (int i = 0; i < field.length; i++) {
      final containBatch = _timeTables
          .where((e) => e.batch == field[i][batchColIndex])
          .isNotEmpty;
      if (i != 0) {
        if (!containBatch) {
          _timeTables.add(generateTimetable(i));
        } else {
          _timeTables[_timeTables
                  .indexWhere((e) => e.batch == field[i][batchColIndex])]
              .week
              .add(
                Day(
                    day: field[i][dayColIndex],
                    subjects: getSubjects(field[i])),
              );
        }
      }
    }
    _timeTables = patch(_timeTables);
    printTimetable(_timeTables);
  }

  void printTimetable(List<TimeTable> timetables) {
    if (kDebugMode) {
      for (var e in timetables) {
        print(e.batch);
        (e.week.forEach((e) {
          if (kDebugMode) {
            print(e.day);
            print(e.subjects.map((e) => e.subjectName).toList());
          }
        }));
        print("\n\n");
      }
    }
  }

  Future<void> get selectFile async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["csv"]);

    if (result != null) {
      final path = result.files.single.path!;
      final input = File(path).openRead();
      field.value = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();
    }
  }
}
