import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../services/hive/models/user_info.dart';
import '../const/holiday_list.dart';
import '../models/analytics/analytics_log.dart';
import '../models/log/log.dart';
import '../models/time_table/time_table.dart' as timetable;
import 'gsheets_utils.dart';

extension IsCurrentTime on timetable.DayTime {
  bool get isCurrentTime => DateTime.now().hour == hour;
}

extension HourString on timetable.DayTime {
  String get hourString => hour > 12 ? (hour - 12).toString() : hour.toString();
}

extension StartEndTimeRange on timetable.DayTime {
  String get startEndTimeRange {
    String start = _timeString(hour);
    final end = _timeString(hour + 1);
    return "$start - $end";
  }
}

String _timeString(int hour) {
  String start = "";
  (hour > 11)
      ? (hour == 12)
          ? start = "12:00 PM"
          : start = "${hour - 12}:00 PM"
      : start = "$hour:00 AM";
  return start;
}

extension ColorAlphaBlend on Color {
  Color alphaBlendColor([Color? color1, Color? color2]) => Color.alphaBlend(
        (color2 ?? Get.theme.colorScheme.primary)
            .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
        color1 ?? Get.theme.cardColor,
      );
}

extension ToSheetRowList on List<LogData> {
  List<List<dynamic>> get toSheetRowList => map(
        (e) => [GSheetUtils.dateToGsheetsDate(e.date), e.name, e.email, e.log],
      ).toList();
}

extension ToListLogData on List<List<dynamic>> {
  Iterable<LogData> get toListLogData => map((e) => LogData(
        date: GSheetUtils.gsheetsDateToDate(e[0]) ?? DateTime.now(),
        name: e[1],
        email: e[2],
        log: e[3],
      ));
}

extension DayEquality on timetable.Day {
  bool equals(timetable.Day day, [timetable.Day? day2]) =>
      ((day2?.day ?? day) == day.day)
          ? const ListEquality()
              .equals(day2?.subjects ?? subjects, day.subjects)
          : false;
}

// extension Range on num {
//   bool isBetween(num from, num to) => from <= this && this <= to;
// }

extension ToDateTime on Holiday {
  DateTime get toDateTime => DateTime(year, month, day);
}

extension UserAnalyticsLog on UserInfo {
  AnalyticsLog get toAnalyticsLog => AnalyticsLog(
        id: id,
        slot: slot,
        batch: batch,
        stream: stream,
        year: year,
        date: DateTime.now(),
      );
}

extension StringSplit on String {
  Map<String, String> get splitString {
    late final int breakPoint;
    for (int i = 0; i < length; i++) {
      final n = int.tryParse(this[i]);
      if (n is int) {
        breakPoint = i;
        break;
      }
    }
    final string = substring(0, breakPoint);
    final num = substring(breakPoint);
    return {
      string: num,
    };
  }
}
