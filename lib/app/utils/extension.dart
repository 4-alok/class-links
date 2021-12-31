import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

extension StartingTimeText on DayTime {
  String get text12Hour => (hour > 12)
      ? (hour - 2).toString() + ':00 PM'
      : hour.toString() + ':00 AM';
}

extension IsCurrentTime on DayTime {
  bool get isCurrentTime => DateTime.now().hour == hour;
}

extension HourString on DayTime {
  String get hourString => hour > 12 ? (hour - 12).toString() : hour.toString();
}

extension EndingTimeText on DayTime {
  String get text12HourEnd => (hour > 12)
      ? (hour - 1).toString() + ':00 PM'
      : (hour + 1).toString() + ':00 AM';
}

extension StartEndTime on DayTime {
  String get text12HourStartEnd => "$text12Hour - $text12HourEnd";
}

extension ColorAlphaBlend on Color {
  Color get alphaBlendColor => Color.alphaBlend(
        Get.theme.colorScheme.primary.withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
        Get.theme.cardColor,
      );
}
