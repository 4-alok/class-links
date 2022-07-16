// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import '../../../models/time_table/time_table.dart';

class ElectiveTimetable {
  final String day;
  final String? section;
  final List<Subject> subjects;
  ElectiveTimetable({
    required this.day,
    this.section,
    required this.subjects,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'day': day,
        'section': section,
        'subjects': subjects.map((x) => x.toJson()).toList(),
      };

  factory ElectiveTimetable.fromMap(Map<String, dynamic> map) =>
      ElectiveTimetable(
        day: map['day'] as String,
        section: map['section'] != null ? map['section'] as String : null,
        subjects: List<Subject>.from(
          (map['subjects'] as List<int>).map<Subject>(
            (x) => Subject.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );

  String toJson() => json.encode(toMap());

  factory ElectiveTimetable.fromJson(String source) =>
      ElectiveTimetable.fromMap(json.decode(source) as Map<String, dynamic>);
}
