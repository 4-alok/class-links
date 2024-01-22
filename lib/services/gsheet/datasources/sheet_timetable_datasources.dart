import 'dart:async';

import 'package:class_link/global/models/sheet_data/sheet_data.dart';
import 'package:class_link/global/models/time_table/time_table.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:get/get.dart';

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

  // int? get year => hiveDatabase.userBoxDatasources.userInfo.value?.year;
  int? get semester =>
      hiveDatabase.userBoxDatasources.userInfo.value?.semester;

  /// Fetching the timetable of the user./// A annotation.
  @override
  Future<TimeTable?> getMyTimetable() async {
    try {
      /// Fetching the data from the google sheet.
      final List<List<String>> timetableData = (await getSheetRowsList).rowList;

      /// Getting the index of the header of the sheet.
      final sheetHeaderIndex = getSheetHeaderIndex(timetableData.first);

      /// Getting the batch of the user from the hive database.
      final myBatch =
          hiveDatabase.userBoxDatasources.userInfo.value?.batch ?? "";

      List<TimeTable> timeTableL = List.empty(growable: true);

      for (int i = 1; i < timetableData.length; i++) {
        // if the row is empty then skip the row.
        if (timetableData[i].isEmpty) continue;

        if (timetableData[i][sheetHeaderIndex.sec] == myBatch) {
          timeTableL.isEmpty
              ? timeTableL.add(TimeTable(
                  week: [
                    Day(
                      day: toFullDayString(
                          timetableData[i][sheetHeaderIndex.day]),
                      subjects: getSubject(timetableData[i], sheetHeaderIndex),
                    )
                  ],
                  creatorId: '',
                  batch: timetableData[i][sheetHeaderIndex.sec],
                  year: 1,
                  slot: 1,
                  date: DateTime.now(),
                ))
              : timeTableL.first.week.add(
                  Day(
                    day:
                        toFullDayString(timetableData[i][sheetHeaderIndex.day]),
                    subjects: getSubject(timetableData[i], sheetHeaderIndex),
                  ),
                );
        }
      }
      timeTableL = patch(timeTableL);
      // await _saveTimetable(timeTableL.first);
      return timeTableL.first;
    } catch (e) {
      rethrow;
      // return null;
    }
  }

  @override
  Future<List<TimeTable>> get getTimetableData async {
    final timetableData = (await getSheetRowsList).rowList;
    List<TimeTable> timeTableList = [];
    final sheetHeaderIndex = getSheetHeaderIndex(timetableData.first);

    for (var i = 1; i < timetableData.length; i++) {
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
                creatorId: '2005847@kiit.ac.in',
                batch: batch,
                year: 1,
                slot: 1,
                date: DateTime.now(),
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
    // printTimetable(timeTableList);
    return timeTableList;
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
      // final res = gSheetService.spreadsheet.isCompleted;
      // print("Is Spreadsheet Loaded: $res");
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
    // if (year == null) throw Exception("UserInfo is not saved");
    if (spreadsheet != null) {
      // final sheetData = spreadsheet.worksheetByTitle("$year-year-$sheetName");
      final sheetData = spreadsheet.worksheetByTitle("6-semester");
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

  // Future<SheetData> get getData2 async {
  //   final spreadsheet = await gSheetService.spreadsheet.future;
  //   if (year == null) throw Exception("UserInfo is not saved");
  //   if (spreadsheet != null) {
  //     final sheetData = spreadsheet.worksheetByTitle("6-semester");
  //     if (sheetData != null) {
  //       final data = await sheetData.values.allRows();
  //       return SheetData(rowList: data);
  //     } else {
  //       throw Exception("Error while fetching worksheet data");
  //     }
  //   } else {
  //     throw Exception("Error while fetching spreadsheet");
  //   }
  // }

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
