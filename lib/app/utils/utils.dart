import 'package:intl/intl.dart';

class Utils {
  static String formateDate(
    DateTime dateTime, [
    bool todayString = false,
    bool showTime = false,
  ]) {
    final currentDate = DateTime.now();
    if (dateTime.day == currentDate.day) {
      return todayString ? 'Today' : DateFormat('hh:mm a').format(dateTime);
    } else if (dateTime.day == currentDate.day - 1) {
      return showTime
          ? ("Yesterday " + DateFormat('hh:mm a').format(dateTime))
          : 'Yesterday';
    } else {
      return showTime
          ? DateFormat('MMM dd').format(dateTime) +
              " " +
              DateFormat('hh:mm a').format(dateTime)
          : DateFormat('MMM dd').format(dateTime);
    }
  }
}
