import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

import '../controllers/holiday_controller.dart';

class HolidaysView extends GetView<HolidayController> {
  const HolidaysView({super.key});
  @override
  Widget build(BuildContext context) {
    final color = Color.alphaBlend(
        Theme.of(context)
            .colorScheme
            .primary
            .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
        Theme.of(context).cardColor);
    final today = DateTime.now();
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: pageVerticalCalendar(today, color),
      ),
    );
  }

  PagedVerticalCalendar pageVerticalCalendar(DateTime today, Color color) =>
      PagedVerticalCalendar(
        physics: const BouncingScrollPhysics(),
        minDate: DateTime(2024, 01, 00),
        maxDate: DateTime(2024, 12, 31),
        initialDate: DateTime(today.year, today.month, today.day),
        monthBuilder: (context, month, year) =>
            monthsBuilder(month, year, context),
        dayBuilder: (context, date) {
          if (controller.isHoliday(date) && DateUtils.isSameDay(date, today)) {
            return Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              message: controller.getHolidayName(date),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                elevation: 10,
                color: Theme.of(context).colorScheme.secondary.withAlpha(100),
                child: Padding(
                  padding: const EdgeInsets.all(.01),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(8)),
                      color: Theme.of(context).primaryColor.withAlpha(200),
                      child: Center(
                          child: Text(
                        date.day.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ))),
                ),
              ),
            );
          } else if (DateUtils.isSameDay(date, today)) {
            return Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              message: "Today",
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                elevation: 5,
                color: Theme.of(context).colorScheme.secondary,
                child: Center(
                    child: Text(
                  date.day.toString(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                )),
              ),
            );
          } else if (controller.isHoliday(date)) {
            return Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              message: controller.getHolidayName(date),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                elevation: 5,
                color: Theme.of(context).primaryColor.withAlpha(200),
                child: Center(
                    child: Text(
                  date.day.toString(),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                )),
              ),
            );
          } else if (date.weekday == 6 || date.weekday == 7) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              color: Theme.of(context).primaryColor.withAlpha(80),
              child: Center(child: Text(date.day.toString())),
            );
          } else {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              color: color,
              child: Center(child: Text(date.day.toString())),
            );
          }
        },
      );

  Widget monthsBuilder(int month, int year, BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${controller.getMonths[month - 1]} $year',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: controller.getDays
                  .map((e) => weekText(e.substring(0, 3)))
                  .toList(),
            ),
          ),
        ],
      );

  AppBar get appBar => AppBar(
        leading: Hero(
          tag: "back",
          child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowLeft),
              onPressed: () => Get.back()),
        ),
        title: const Text('Holidays'),
        centerTitle: true,
      );

  Widget weekText(String text) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      );
}
