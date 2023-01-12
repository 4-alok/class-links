// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../../../global/models/time_table/time_table.dart';

class MyElectiveSubjects {
  final String day;
  final List<Subject> subjects;
  const MyElectiveSubjects({required this.day, required this.subjects});

  @override
  bool operator ==(covariant MyElectiveSubjects other) => identical(this, other)
      ? true
      : other.day == day && listEquals(other.subjects, subjects);

  @override
  int get hashCode => day.hashCode ^ subjects.hashCode;
}
