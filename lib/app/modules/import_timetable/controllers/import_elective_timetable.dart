import 'package:class_link/app/models/time_table/time_table.dart';

import '../../../services/firebase/models/elective_timetable.dart';
import 'get_csv_file.dart';

class Import3YearElectiveTimetable with GetFile {
  List<Subject> _generateSubject(List row) {
    List<Subject> subjects = [];

    if (row[3] != 'x') {
      subjects.add(
        Subject(
          subjectName: row[3].toString(),
          startTime: const DayTime(hour: 15, minute: 0),
          roomNo: row[2].toString(),
        ),
      );
    }

    if (row[5] != 'x') {
      subjects.add(
        Subject(
          subjectName: row[5].toString(),
          startTime: const DayTime(hour: 16, minute: 0),
          roomNo: row[4].toString(),
        ),
      );
    }

    if (row[7] != 'x') {
      subjects.add(
        Subject(
          subjectName: row[7].toString(),
          startTime: const DayTime(hour: 17, minute: 0),
          roomNo: row[6].toString(),
        ),
      );
    }
    return subjects;
  }

  Future<List<ElectiveTimetable>> get electiveTimetable async {
    final data = await getFileData;
    data.removeAt(0);
    List<ElectiveTimetable> electiveTimetables = [];

    for (var row in data) {
      final subjects = _generateSubject(row);
      if (subjects.isNotEmpty) {
        electiveTimetables.add(
          ElectiveTimetable(
            day: row[0].toString(),
            section: row[1].toString(),
            subjects: subjects,
          ),
        );
      }
    }
    return electiveTimetables;
  }
}
