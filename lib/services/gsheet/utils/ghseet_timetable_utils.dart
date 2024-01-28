import '../../../global/models/time_table/time_table.dart';
import '../models/sheet_header_index_model.dart';

mixin GsheetTimetableUtils {
  /// Adds missing days (Saturday and Sunday) to the week of each [TimeTable] in the given list.
  /// If a [TimeTable] already has Saturday in its week, it adds Sunday to the week.
  /// Otherwise, it adds both Saturday and Sunday to the week.
  /// Returns the updated list of [TimeTable].
  List<TimeTable> patch(List<TimeTable> timetables) {
    timetables
        .map((e) =>
            e.week.where((element) => element.day == "Saturday").isNotEmpty
                ? e.week.add(const Day(day: "Sunday", subjects: []))
                : e.week.addAll([
                    const Day(day: "Saturday", subjects: []),
                    const Day(day: "Sunday", subjects: [])
                  ]))
        .toList();
    return timetables;
  }

  List<Subject> getSubject(List<String> row, SheetHeaderIndex index) {
    final List<Subject> subjects = List.empty(growable: true);
    for (int i in index.subjects) {
      (row[i].toLowerCase() == "x")
          ? null
          : subjects.add(
              Subject(
                subjectName: row[i],
                roomNo: getRoomNo(row, i, index.roomNos),
                startTime:
                    DayTime(hour: int.tryParse(index.value[i]) ?? 0, minute: 0),
              ),
            );
    }
    return subjects;
  }

  String getRoomNo(List<String> row, int index, List<int> roomNos) {
    for (int i in roomNos) {
      if (row[i].toLowerCase() == 'x') {
        continue;
      } else if (i < index) {
        return row[i];
      }
    }
    return '';
  }

  SheetHeaderIndex getSheetHeaderIndex(List<String> header) {
    final int day = header.indexOf('DAY');
    final int sec =
        header.indexWhere((element) => element.toLowerCase().startsWith("sec"));

    final List<int> subjects = List.empty(growable: true);
    for (int i = 1; i < 24; i++) {
      if (header.contains('$i')) {
        subjects.add(header.indexOf('$i'));
      }
    }

    final List<int> rooms = List.empty(growable: true);
    for (String s in header) {
      if (s.toLowerCase().startsWith("room")) {
        rooms.add(header.indexOf(s));
      }
    }
    rooms.sort((b, a) => a.compareTo(b));
    return SheetHeaderIndex(
        value: header, day: day, sec: sec, roomNos: rooms, subjects: subjects);
  }
}
