import '../global/const/holiday_list.dart';
import '../models/analytics/analytics_log.dart';
import '../models/log/log.dart';
import '../models/time_table/time_table.dart' as timetable;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/route_manager.dart';
import '../models/user_info/user_info.dart';
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
          : start = (hour - 12).toString() + ":00 PM"
      : start = hour.toString() + ":00 AM";
  return start;
}

extension ColorAlphaBlend on Color {
  Color alphaBlendColor([Color? _color1, Color? _color2]) => Color.alphaBlend(
        (_color2 ?? Get.theme.colorScheme.primary)
            .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
        _color1 ?? Get.theme.cardColor,
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
  bool equals(timetable.Day _day, [timetable.Day? _day2]) =>
      ((_day2?.day ?? day) == _day.day)
          ? const ListEquality()
              .equals(_day2?.subjects ?? subjects, _day.subjects)
          : false;
}

extension Range on num {
  bool isBetween(num from, num to) => from <= this && this <= to;
}

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
    late final int _break;
    for (int i = 0; i < length; i++) {
      final n = int.tryParse(this[i]);
      if (n is int) {
        _break = i;
        break;
      }
    }
    final string = substring(0, _break);
    final num = substring(_break);
    return {
      string: num,
    };
  }
}
