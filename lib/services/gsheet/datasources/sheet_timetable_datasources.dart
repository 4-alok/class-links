import 'dart:async';

import 'package:class_link/global/models/sheet_data/sheet_data.dart';
import 'package:class_link/global/models/time_table/time_table.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../repository/gsheet_service.dart';
import '../usecase/sheet_timetable.dart';
import '../utils/ghseet_timetable_utils.dart';

// const sheetName = 'timetable';
const sheetName = 'timetable-new';

class SheetTimetableDatasources
    with GsheetTimetableUtils
    implements SheetTimetableUsecase {
  final GSheetService gSheetService;
  SheetTimetableDatasources({required this.gSheetService});

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  int get year => hiveDatabase.userBoxDatasources.userInfo?.year ?? 0;

  Future<void> _saveTimetable(TimeTable timeTable) async =>
      await hiveDatabase.cacheBoxDataSources
          .saveRequest("$year-year-$sheetName", timeTable.toJson());

  @override
  Future<TimeTable?> get getMyTimetableCache async {
    final data = await hiveDatabase.cacheBoxDataSources
        .getRequest("$year-year-$sheetName");
    if (data != null) {
      return TimeTable.fromJson(data);
    } else {
      return null;
    }
  }

  @override
  Future<DateTime?> get getMyTimetableCacheDate async =>
      await hiveDatabase.cacheBoxDataSources
          .getCacheDate("$year-year-$sheetName");

  /// Fetching the timetable of the user./// A annotation.
  @override
  Future<TimeTable> get getMyTimetable async {
    /// Fetching the data from the google sheet.
    final timetableData = (await getSheetRowsList).rowList;

    /// Getting the index of the header of the sheet.
    final sheetHeaderIndex = getSheetHeaderIndex(timetableData.first);

    /// Getting the batch of the user from the hive database.
    final myBatch = hiveDatabase.userBoxDatasources.userInfo?.batch ?? "";
    List<TimeTable> timeTableL = List.empty(growable: true);

    for (int i = 1; i < timetableData.length; i++) {
      if (timetableData[i][sheetHeaderIndex.sec] == myBatch) {
        timeTableL.isEmpty
            ? timeTableL.add(TimeTable(
                week: [
                  Day(
                    day: timetableData[i][sheetHeaderIndex.day],
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
                  day: timetableData[i][sheetHeaderIndex.day],
                  subjects: getSubject(timetableData[i], sheetHeaderIndex),
                ),
              );
      }
    }
    patch(timeTableL);
    await _saveTimetable(timeTableL.first);
    return timeTableL.first;
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

  void printTimetable(List<TimeTable> timetables) async {
    if (kDebugMode) {
      for (var t in timetables) {
        print(t.batch);
        for (var d in t.week) {
          if (kDebugMode) {
            print(d.day);
            print(d.subjects
                .map((e) => "${e.subjectName}|${e.roomNo}|${e.startTime.hour}")
                .toList());
          }
        }
        print("\n\n");
      }
    }
  }

  @override
  Future<SheetData> get getSheetRowsList async {
    try {
      return gSheetService.spreadsheetLoaded.value
          ? await getData
          : await gSheetService.loadSpreadSheet
              .then<SheetData>((value) async => await getData);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<SheetData> get getData async {
    final spreadsheet = gSheetService.spreadsheet;
    if (spreadsheet != null) {
      final sheetData = spreadsheet.worksheetByTitle("$year-year-$sheetName");
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
}
