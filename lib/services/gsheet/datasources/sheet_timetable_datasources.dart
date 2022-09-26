import 'dart:async';

import 'package:class_link/global/models/time_table/time_table.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../repository/gsheet_service.dart';
import '../usecase/sheet_timetable.dart';

const sheetName = 'timetable';

class SheetHeaderIndex {
  final List<String> value;
  final int day;
  final int sec;
  final List<int> roomNos;
  final List<int> subjects;
  const SheetHeaderIndex(
      {required this.value,
      required this.day,
      required this.sec,
      required this.roomNos,
      required this.subjects});

  @override
  String toString() =>
      'SheetHeaderIndex(day: $day, sec: $sec, roomNos: $roomNos, subjects: $subjects)';
}

class SheetTimetableDatasources implements SheetTimetableUsecase {
  final GSheetService gSheetService;
  SheetTimetableDatasources({required this.gSheetService});

  SheetHeaderIndex getSheetHeaderIndex(List<String> header) {
    final int day = header.indexOf('DAY');
    final int sec = header.indexOf('SEC');

    final List<int> subjects = List.empty(growable: true);
    for (int i = 1; i < 24; i++) {
      if (header.contains('$i')) {
        subjects.add(header.indexOf('$i'));
      }
    }

    final List<int> rooms = List.empty(growable: true);
    for (String s in header) {
      if (s.toLowerCase().startsWith("room")) {
        rooms.add(header.indexOf(s));
      }
    }
    rooms.sort((b, a) => a.compareTo(b));
    return SheetHeaderIndex(
        value: header, day: day, sec: sec, roomNos: rooms, subjects: subjects);
  }

  String getRoomNo(List<String> row, int index, List<int> roomNos) {
    for (int i in roomNos) {
      if (row[i].toLowerCase() == 'x') {
        continue;
      } else if (i < index) {
        return row[i];
      }
    }
    return '';
  }

  List<Subject> getSubject(List<String> row, SheetHeaderIndex index) {
    final List<Subject> subjects = List.empty(growable: true);
    for (int i in index.subjects) {
      if (row[i].toLowerCase() == "x") {
        continue;
      } else {
        subjects.add(
          Subject(
            subjectName: row[i],
            roomNo: getRoomNo(row, i, index.roomNos),
            startTime:
                DayTime(hour: int.tryParse(index.value[i]) ?? 0, minute: 0),
          ),
        );
      }
    }
    return subjects;
  }

  @override
  Future get getTimetableData async {
    final timetableData = await getSheetRowsList;
    List<TimeTable> timeTableList = [];

    final sheetHeaderIndex = getSheetHeaderIndex(timetableData.first);

    for (var i = 1; i < timetableData.length; i++) {
      final batch = timetableData[i][sheetHeaderIndex.sec];
      if (timeTableList.where((element) => element.batch == batch).isEmpty) {
        timeTableList.add(
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
        );
      } else {
        final index = timeTableList.indexWhere((element) =>
            element.batch == timetableData[i][sheetHeaderIndex.sec]);
        timeTableList[index].week.add(
              Day(
                day: timetableData[i][sheetHeaderIndex.day],
                subjects: getSubject(timetableData[i], sheetHeaderIndex),
              ),
            );
      }
    }

    printTimetable(timeTableList);
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
        ;
        print("\n\n");
      }
    }
  }

  @override
  Future<List<List<String>>> get getSheetRowsList async {
    try {
      return gSheetService.spreadsheetLoaded.value
          ? getData
          : await gSheetService.loadSpreadSheet
              .then<Future<List<List<String>>>>((value) => getData);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<List<String>>> get getData async {
    final spreadsheet = gSheetService.spreadsheet;
    if (spreadsheet != null) {
      final year =
          Get.find<HiveDatabase>().userBoxDatasources.userInfo?.year ?? 0;
      final sheetData = spreadsheet.worksheetByTitle("5-sem-$sheetName");
      if (sheetData != null) {
        return await sheetData.values.allRows();
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }
}
