// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:class_link/global/models/time_table/time_table.dart';

import 'compare/timetable.dart';

final s1 = Subject(subjectName: "s1", startTime: DayTime(hour: 9, minute: 0));
final s2 = Subject(subjectName: "s1", startTime: DayTime(hour: 9, minute: 0));
final s3 = Subject(subjectName: "s3", startTime: DayTime(hour: 1, minute: 0));
final s4 = Subject(subjectName: "s4", startTime: DayTime(hour: 3, minute: 0));
final s5 = Subject(subjectName: "s5", startTime: DayTime(hour: 4, minute: 0));
final s6 = Subject(subjectName: "s6", startTime: DayTime(hour: 5, minute: 0));

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
      final d1 = Day(
        day: "Monday",
        subjects: [s1, s2, s3],
      );

      final d2 = Day(
        day: "Monday",
        subjects: [s1, s2, s3],
      );

      final res = d1 == d2;

      expect(res, true);
    });

    test("Subject List equality", () {
      final l1 = [s1, s2, s3];
      final l2 = [s2, s2, s3];

      final listEquality = const ListEquality().equals;
      final res = listEquality(l1, l2);

      expect(res, true);
    });

    test("TimeTable equality", () {
      final d1 = Day(day: "Monday", subjects: [s1, s2, s3]);
      final d2 = Day(day: "Monday", subjects: [s1, s2, s3]);

      final res = d1.equal(d2);

      expect(res, true);
    });
  });
}
