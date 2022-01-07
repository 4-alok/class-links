import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

extension StartingTimeText on DayTime {
  String get text12Hour => (hour > 12)
      ? (hour - 12).toString() + ':00 PM'
      : hour.toString() + ':00 AM';
}

extension IsCurrentTime on DayTime {
  bool get isCurrentTime => DateTime.now().hour == hour;
}

extension HourString on DayTime {
  String get hourString => hour > 12 ? (hour - 12).toString() : hour.toString();
}

extension EndingTimeText on DayTime {
  String get text12HourEnd => (hour + 1 > 12)
      ? (hour - 11).toString() + ':00 PM'
      : (hour + 1).toString() + ':00 AM';
}

extension StartEndTime on DayTime {
  String get text12HourStartEnd => "$text12Hour - $text12HourEnd";
}

extension ColorAlphaBlend on Color {
  Color alphaBlendColor([Color? _color1, Color? _color2]) => Color.alphaBlend(
        (_color2 ?? Get.theme.colorScheme.primary)
            .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
        _color1 ?? Get.theme.cardColor,
      );
}
