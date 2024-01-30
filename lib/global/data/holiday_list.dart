const List<String> months = [
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

const Set<Holiday> holidayList = {
  Holiday(2024, 01, 26, "REPUBLIC DAY"),
  Holiday(2024, 02, 14, "BASANTA PANCHAMI"),
  Holiday(2024, 03, 05, "PANCHAYATIRAJ DIWAS"),
  Holiday(2024, 03, 08, "MAHA SHIVARATRI"),
  Holiday(2024, 03, 26, "HOLI"),
  Holiday(2024, 03, 29, "GOOD FRIDAY"),
  Holiday(2024, 04, 01, "UTKAL DIVAS"),
  Holiday(2024, 04, 11, "ID –UL –FITRE"),
  Holiday(2024, 04, 17, "RAM NAVAMI"),
  Holiday(2024, 06, 17, "ID –UL –JUHA"),
  Holiday(2024, 07, 17, "MUHARRAM"),
  Holiday(2024, 08, 15, "INDEPENDENCE DAY"),
  Holiday(2024, 08, 26, "JANAMASTAMI"),
  Holiday(2024, 09, 16, "BIRTHDAY OF PROPHET MOHAMMMAD"),
  Holiday(2024, 10, 02, "GANDHI JAYANTI"),
  Holiday(2024, 10, 10, "DURGA PUJA"),
  Holiday(2024, 10, 11, "DURGA PUJA"),
  Holiday(2024, 10, 12, "DURGA PUJA"),
  Holiday(2024, 10, 13, "DURGA PUJA"),
  Holiday(2024, 10, 14, "DURGA PUJA"),
  Holiday(2024, 10, 15, "DURGA PUJA"),
  Holiday(2024, 10, 16, "	DURGA PUJA"),
  Holiday(2024, 10, 31, "KALIPUJA & DIWALI"),
  Holiday(2024, 11, 15, "KARTIKA PURNIMA / GURU NANAK’S BIRTHDAY"),
  Holiday(2024, 12, 25, "CHRISTMAS"),
  Holiday(2024, 04, 14, "MAHA VISHUBHA SANKRATI"),
  Holiday(2024, 06, 15, "RAJA SANKRATI"),
  Holiday(2024, 07, 07, "RATH YATRA"),
  Holiday(2024, 09, 07, "GANESH PUJA"),
  Holiday(2024, 09, 08, "NUAKHAI"),
};

class Holiday {
  final int year;
  final int month;
  final int day;
  final String name;
  const Holiday(this.year, this.month, this.day, this.name);
}
