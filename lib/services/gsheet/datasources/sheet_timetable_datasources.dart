import 'dart:async';

import 'package:get/get.dart';

import '../../../global/models/sheet_data/sheet_data.dart';
import '../../../global/models/time_table/time_table.dart';
import '../../../global/models/time_table/timetables.dart';
import '../../hive/repository/hive_database.dart';
import '../repository/gsheet_service.dart';
import '../usecase/sheet_timetable.dart';
import '../utils/ghseet_timetable_utils.dart';

// const sheetName = 'timetable';
const sheetName = 'timetable';

class SheetTimetableDatasources
    with GsheetTimetableUtils
    implements SheetTimetableUsecase {
  final GSheetService gSheetService;
  SheetTimetableDatasources({required this.gSheetService});

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  int? get semester => hiveDatabase.userBoxDatasources.userInfo.value?.semester;

  @override
  Future<TimeTables> get getTimetableData async {
    final timetableData = (await getSheetRowsList).rowList;
    List<TimeTable> timeTableList = [];
    final sheetHeaderIndex = getSheetHeaderIndex(timetableData.first);
    for (var i = 1; i < timetableData.length; i++) {
      if (timetableData[i].isEmpty) continue;
      final batch = timetableData[i][sheetHeaderIndex.sec];
      (timeTableList.where((element) => element.batch == batch).isEmpty)
          ? timeTableList.add(
              TimeTable(
                week: [
                  Day(
                    day: timetableData[i][sheetHeaderIndex.day],
                    subjects: getSubject(timetableData[i], sheetHeaderIndex),
                  )
                ],
                batch: batch,
                semester: semester ?? -1,
              ),
            )
          : timeTableList[timeTableList.indexWhere((element) =>
                  element.batch == timetableData[i][sheetHeaderIndex.sec])]
              .week
              .add(
                Day(
                  day: timetableData[i][sheetHeaderIndex.day],
                  subjects: getSubject(timetableData[i], sheetHeaderIndex),
                ),
              );
    }
    patch(timeTableList);
    return TimeTables(timeTableList);
  }

  // void printTimetable(List<TimeTable> timetables) async {
  //   if (kDebugMode) {
  //     for (var t in timetables) {
  //       print(t.batch);
  //       for (var d in t.week) {
  //         if (kDebugMode) {
  //           print(d.day);
  //           print(d.subjects
  //               .map(
  //                   (e) => "${e.subjectName},${e.roomNo},${e.startTime.hour}||")
  //               .toList());
  //         }
  //       }
  //       print("\n\n");
  //     }
  //   }
  // }

  @override
  Future<SheetData> get getSheetRowsList async {
    try {
      return gSheetService.spreadsheet.isCompleted
          ? await getData
          : await gSheetService.spreadsheet.future
              .then<SheetData>((value) async => await getData);
    } catch (e) {
      rethrow;
    }
  }

  Future<SheetData> get getData async {
    final spreadsheet = await gSheetService.spreadsheet.future;
    if (spreadsheet != null) {
      final sheetData = spreadsheet.worksheetByTitle("$semester-semester");
      if (sheetData != null) {
        final data = await sheetData.values.allRows();
        return SheetData(rowList: data);
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }

  // Create a function to change string SAT to Saturday and so on.
  String toFullDayString(String shortDay) {
    switch (shortDay) {
      case "MON":
        return "Monday";
      case "TUE":
        return "Tuesday";
      case "WED":
        return "Wednesday";
      case "THU":
        return "Thursday";
      case "FRI":
        return "Friday";
      case "SAT":
        return "Saturday";
      case "SUN":
        return "Sunday";
      default:
        return "Monday";
    }
  }
}
