import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../global/const/const.dart';
import '../../../global/data/holiday_list.dart';

/// It checks if the date is a holiday
class HolidayController extends GetxController {
  List<String> get getMonths => months;
  List<String> get getDays => Days.days;

  /// It checks if the date is a holiday.
  ///
  /// Args:
  ///   date (DateTime): The date to check if it's a holiday.
  bool isHoliday(DateTime date) =>
      holidayList.map((e) => DateTime(e.year, e.month, e.day)).contains(date);

  /// > It returns the name of the holiday that occurs on the given date
  ///
  /// Args:
  ///   date (DateTime): The date you want to check if it's a holiday.
  ///
  /// Returns:
  ///   The name of the holiday.
  String getHolidayName(DateTime date) {
    final holiday = holidayList.firstWhere(
      (e) => DateTime(e.year, e.month, e.day) == date,
    );
    return holiday.name;
  }
}
