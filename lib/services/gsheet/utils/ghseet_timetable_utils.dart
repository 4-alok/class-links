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

  /// Retrieves a list of subjects from a given row of data and a sheet header index.
  ///
  /// The [row] parameter represents a list of strings containing the data for a single row.
  /// The [index] parameter represents the sheet header index, which contains information about the positions of subjects, room numbers, and start times in the row.
  ///
  /// Returns a list of [Subject] objects extracted from the row, excluding any subjects marked with "x".
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

  /// Retrieves the room number from the given row based on the provided index and list of room numbers.
  ///
  /// The function iterates through the list of room numbers and checks if the corresponding cell in the row contains 'x'.
  /// If it does, the loop continues to the next iteration.
  /// If the index of the current room number is less than the provided index, the function returns the value in that cell.
  /// If no valid room number is found, an empty string is returned.
  ///
  /// Parameters:
  /// - row: The list of strings representing a row in a spreadsheet.
  /// - index: The index of the current cell in the row.
  /// - roomNos: The list of integers representing the indices of the room number cells in the row.
  ///
  /// Returns:
  /// The room number as a string, or an empty string if no valid room number is found.
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

  // TODO: !! ----------------- Optimizations needed ------------------- !!

  /// Retrieves the indices of various headers in the given [header] list.
  ///
  /// The [header] list represents the headers of a Google Sheets timetable.
  /// This function returns a [SheetHeaderIndex] object containing the indices
  /// of the 'DAY' header, the 'sec' header (which starts with "sec" in lowercase),
  /// the indices of the subject headers (numbered 1 to 24), and the indices of
  /// the room headers (starting with "room" in lowercase).
  ///
  /// The returned [SheetHeaderIndex] object can be used to access the indices
  /// of the headers for further processing.
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
  // !! --------------------- Optimizations needed --------------------- !!
}
