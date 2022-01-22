import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:flutter_test/flutter_test.dart';

import 'compare/timetable.dart';

const s1 = Subject(subjectName: "s1", startTime: DayTime(hour: 9, minute: 0));
const s2 = Subject(subjectName: "s1", startTime: DayTime(hour: 9, minute: 0));
const s3 = Subject(subjectName: "s3", startTime: DayTime(hour: 1, minute: 0));
const s4 = Subject(subjectName: "s4", startTime: DayTime(hour: 3, minute: 0));
const s5 = Subject(subjectName: "s5", startTime: DayTime(hour: 4, minute: 0));
const s6 = Subject(subjectName: "s6", startTime: DayTime(hour: 5, minute: 0));

void main() {
  group('Is Equal', () {
    test("subject Equality if equal", () {
      final res = s1 == s2;
      expect(res, true);
    });

    test("subject Equality if not-equal", () {
      final res = s1 == s3;
      expect(res, false);
    });

    test("Day Equality if equal", () {
      const d1 = Day(
        day: "Monday",
        subjects: [s1, s2, s3],
      );

      const d2 = Day(
        day: "Monday",
        subjects: [s1, s2, s3],
      );

      final res = d1 == d2;

      expect(res, true);
    });

    test("Day Equality if not-equal", () {
      const d1 = Day(
        day: "Monday",
        subjects: [s1],
      );

      const d2 = Day(
        day: "Monday",
        subjects: [s1],
      );

      // final res = d1.toJson() == d2.toJson(); //Not equal
      final res = TT.dayEqual(d1, d2);

      expect(res, false);
    });
  });


}
