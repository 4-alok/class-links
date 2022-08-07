import 'package:class_link/global/models/time_table/time_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension DayEquality on Day {
  bool equal(Day day, [Day? day2]) {
    if ((day2?.day ?? day) == day.day) {
      return const ListEquality()
          .equals(day2?.subjects ?? subjects, day.subjects);
    } else {
      return false;
    }
  }
}
