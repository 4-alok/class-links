const months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const List<Holiday> holidayList = [
  Holiday(2022, 01, 26, "REPUBLIC DAY"),
  Holiday(2022, 01, 26, "REPUBLIC DAY"),
  Holiday(2022, 03, 01, "MAHA SHIVRATRI"),
  Holiday(2022, 04, 01, "UTKAL DIVAS"),
  Holiday(2022, 04, 14, "MAHA VISHUBHA SANKRANTI"),
  Holiday(2022, 04, 15, "GOOD FRIDAY"),
  Holiday(2022, 05, 03, "ID-UL-FITRE"),
  Holiday(2022, 06, 15, "RAJA SANKRANTI"),
  Holiday(2022, 07, 01, "RATH YATRA"),
  Holiday(2022, 08, 09, "MUHARRAM"),
  Holiday(2022, 08, 15, "INDEPENDENCE DAY"),
  Holiday(2022, 08, 18, "JANAMASTAMI"),
  Holiday(2022, 08, 31, "GANESH PUJA"),
  Holiday(2022, 09, 01, "NUA KHAI"),
  Holiday(2022, 10, 01, "DURGA PUJA"),
  Holiday(2022, 10, 02, "DURGA PUJA"),
  Holiday(2022, 10, 03, "DURGA PUJA"),
  Holiday(2022, 10, 04, "DURGA PUJA"),
  Holiday(2022, 10, 05, "DURGA PUJA"),
  Holiday(2022, 10, 06, "DURGA PUJA"),
  Holiday(2022, 10, 07, "DURGA PUJA"),
  Holiday(2022, 10, 08, "DURGA PUJA"),
  Holiday(2022, 10, 09, "DURGA PUJA"),
  Holiday(2022, 10, 24, "KALIPUJA & DIWALI"),
  Holiday(2022, 11, 08, "GURU NANAK'S BIRTHDAY & KARTIKA PURNIMA"),
  Holiday(2022, 02, 05, "BASANTA PANCHAMI"),
  Holiday(2022, 03, 05, "PANCHAYATIRAJ DIWAS"),
  Holiday(2022, 03, 19, "HOLI"),
  Holiday(2022, 04, 10, "RAM NAVAMI"),
  Holiday(2022, 07, 10, "ID-UL-JUHA"),
  Holiday(2022, 10, 02, "GANDHI JAYANTI"),
  Holiday(2022, 10, 09, "BIRTHDAY OF PROPHET MOHAMMAD"),
  Holiday(2022, 12, 25, "CHRISTMAS")
];

class Holiday {
  final int year;
  final int month;
  final int day;
  final String name;
  const Holiday(this.year, this.month, this.day, this.name);
}
