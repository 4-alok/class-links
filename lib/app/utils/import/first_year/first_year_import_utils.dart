import '../../../models/time_table/time_table.dart';

class FirstYearS1 {
  List<TimeTable> execute1stYears1(List<String> rows) {
    List<TimeTable> timeTables = [];

    for (final line in rows) {
      final row = line.split(',');

      if (timeTables.where((element) => element.batch == row[1]).isEmpty) {
        final day = Day(
          day: row[0],
          subjects: subjects(row),
        );

        timeTables.add(
          TimeTable(
            week: [day],
            creatorId: "2005847@kiit.ac.in",
            batch: row[1],
            year: 1,
            slot: 1,
            date: DateTime.now(),
          ),
        );
      } else {
        final timeTableIndex =
            timeTables.indexWhere((element) => element.batch == row[1]);
        final day = Day(
          day: row[0],
          subjects: subjects(row),
        );
        timeTables[timeTableIndex].week.add(day);
      }
    }

    return timeTables;
  }

  List<Subject> subjects(List<String> row) {
    List<Subject> subjects = [];
    for (int i = 8; i < 18; i++) {
      if (_subjectName(row, i).toLowerCase() != "x" && _subjectName(row, i) != "") {
        subjects.add(
          Subject(
            subjectName: _subjectName(row, i),
            roomNo: _roomNo(row, i),
            roomNoAddBy: "Alok Kumar,2005847@kiit.ac.in",
            startTime: DayTime(hour: i, minute: 0),
          ),
        );
      }
    }
    return subjects;
  }

  _roomNo(List<String> row, int i) {
    if (i < 11) {
      return row[2];
    } else if (i < 14) {
      return (row[6] == "") ? row[2] : row[6];
    } else {
      return (row[10] == "")
          ? (row[6] == "")
              ? row[2]
              : row[6]
          : row[10];
    }
  }

  // A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
  // 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5

  String _subjectName(List<String> row, int i) {
    switch (i) {
      case 8:
        return row[3];
      case 9:
        return row[4];
      case 10:
        return row[5];
      case 11:
        return row[7];
      case 12:
        return row[8];
      case 13:
        return row[9];
      case 14:
        return "";
      case 15:
        return row[11];
      case 16:
        return row[12];
      case 17:
        return row[13];
      default:
        throw "Error ar $i, $row";
    }
  }
}
