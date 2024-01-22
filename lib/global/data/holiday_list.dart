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
  Holiday(2023, 01, 26, "REPUBLIC DAY & BASANTA PANCHAMI"),
  Holiday(2023, 03, 08, "HOLI"),
  Holiday(2023, 03, 30, "RAM NAVAMI"),
  Holiday(2023, 04, 07, "GOOD FRIDAY"),
  Holiday(2023, 04, 14, "MAHA VISHUBHA SANKRANTI"),
  Holiday(2023, 06, 15, "RAJA SANKRANTI"),
  Holiday(2023, 06, 20, "RATH YATRA"),
  Holiday(2023, 06, 29, "ID-UL-JUHA"),
  Holiday(2023, 08, 15, "INDEPENDENCE DAY"),
  Holiday(2023, 09, 06, "JANAMASTAMI"),
  Holiday(2023, 09, 19, "GANESH PUJA"),
  Holiday(2023, 09, 20, "NUA KHAI"),
  Holiday(2023, 09, 28, "BIRTHDAY OF PROPHET MOHAMMMAD"),
  Holiday(2023, 10, 02, "GANDHI JAYANTI"),
  Holiday(2023, 10, 23, "DURGA PUJA"),
  Holiday(2023, 10, 24, "DURGA PUJA"),
  Holiday(2023, 10, 25, "DURGA PUJA"),
  Holiday(2023, 10, 26, "DURGA PUJA"),
  Holiday(2023, 10, 27, "DURGA PUJA"),
  Holiday(2023, 10, 28, "DURGA PUJA"),
  Holiday(2023, 11, 27, "GURU NANAK'S BIRTHDAY & KARTIKA PURNIMA"),
  Holiday(2023, 12, 25, "CHRISTMAS"),
  Holiday(2023, 02, 18, "MAHA SHIVRATRI"),
  Holiday(2023, 03, 05, "PANCHAYATIRAJ DIWAS"),
  Holiday(2023, 04, 01, "UTKAL DIVAS"),
  Holiday(2023, 04, 22, "ID-UL-FITRE"),
  Holiday(2023, 07, 29, "MUHARRAM"),
  Holiday(2023, 11, 12, "KALIPUJA & DIWALI"),
];

class Holiday {
  final int year;
  final int month;
  final int day;
  final String name;
  const Holiday(this.year, this.month, this.day, this.name);
}
