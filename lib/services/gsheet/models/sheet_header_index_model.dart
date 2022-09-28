class SheetHeaderIndex {
  final List<String> value;
  final int day;
  final int sec;
  final List<int> roomNos;
  final List<int> subjects;
  const SheetHeaderIndex(
      {required this.value,
      required this.day,
      required this.sec,
      required this.roomNos,
      required this.subjects});

  @override
  String toString() =>
      'SheetHeaderIndex(day: $day, sec: $sec, roomNos: $roomNos, subjects: $subjects)';
}
