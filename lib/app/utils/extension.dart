import '../global/const/holiday_list.dart';
import '../models/analytics/analytics_log.dart';
import '../models/log/log.dart';
import '../models/time_table/time_table.dart' as timetable;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/route_manager.dart';
import '../models/user_info/user_info.dart';
import 'gsheets_utils.dart';

extension StartingTimeText on timetable.DayTime {
  String get text12Hour => (hour > 12)
      ? (hour - 12).toString() + ':00 PM'
      : hour.toString() + ':00 AM';
}

extension IsCurrentTime on timetable.DayTime {
  bool get isCurrentTime => DateTime.now().hour == hour;
}

extension HourString on timetable.DayTime {
  String get hourString => hour > 12 ? (hour - 12).toString() : hour.toString();
}

extension EndingTimeText on timetable.DayTime {
  String get text12HourEnd => (hour + 1 > 12)
      ? (hour - 11).toString() + ':00 PM'
      : (hour + 1).toString() + ':00 AM';
}

extension StartEndTime on timetable.DayTime {
  String get text12HourStartEnd => "$text12Hour - $text12HourEnd";
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
  Iterable<LogData> get toListLogData => map(
        (e) => LogData(
          date: GSheetUtils.gsheetsDateToDate(e[0]) ?? DateTime.now(),
          name: e[1],
          email: e[2],
          log: e[3],
        ),
      );
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
