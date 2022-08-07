import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../global/const/holiday_list.dart';

class HolidayController extends GetxController {
  bool isHoliday(DateTime date) =>
      holidayList.map((e) => DateTime(e.year, e.month, e.day)).contains(date);

  String getHolidayName(DateTime date) {
    final holiday = holidayList.firstWhere(
      (e) => DateTime(e.year, e.month, e.day) == date,
    );
    return holiday.name;
  }

  List<String> get getMonths => months;
}
