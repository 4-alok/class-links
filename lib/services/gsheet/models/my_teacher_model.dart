import 'dart:convert';
import 'package:flutter/foundation.dart';

class MyTeachers {
  final String batch;
  final List<Teacher> teachers;
  MyTeachers({required this.batch, required this.teachers});

  MyTeachers copyWith({String? batch, List<Teacher>? teachers}) => MyTeachers(
      batch: batch ?? this.batch, teachers: teachers ?? this.teachers);

  Map<String, dynamic> toMap() => <String, dynamic>{
        'batch': batch,
        'teachers': teachers.map((x) => x.toMap()).toList()
      };

  // factory MyTeachers.fromMap(Map<String, dynamic> map) => MyTeachers(
  //       batch: map['batch'] as String,
  //       teachers: List<Teacher>.from(
  //         (map['teachers'] as List<dynamic>).map<Teacher>(
  //           (x) => Teacher.fromMap(x as Map<String, dynamic>),
  //         ),
  //       ),
  //     );

  // String toJson() => json.encode(toMap());

  // factory MyTeachers.fromJson(String source) =>
  //     MyTeachers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MyTeachers(batch: $batch, teachers: $teachers)';

  @override
  bool operator ==(covariant MyTeachers other) => (identical(this, other))
      ? true
      : other.batch == batch && listEquals(other.teachers, teachers);

  @override
  int get hashCode => batch.hashCode ^ teachers.hashCode;
}

class Teacher {
  final String teacherName;
  final String subjectName;
  const Teacher({required this.teacherName, required this.subjectName});

  Teacher copyWith({String? teacherName, String? subjectName}) =>
      Teacher(teacherName: teacherName ?? this.teacherName, subjectName: subjectName ?? this.subjectName);

  Map<String, dynamic> toMap() =>
      <String, dynamic>{'teacherName': teacherName, 'subjectName': subjectName};



  String toJson() => json.encode(toMap());


  @override
  String toString() => 'Teacher(teacherName: $teacherName, subjectName: $subjectName)';

  @override
  bool operator ==(covariant Teacher other) => (identical(this, other))
      ? true
      : other.teacherName == teacherName && other.subjectName == subjectName;

  @override
  int get hashCode => teacherName.hashCode ^ subjectName.hashCode;
}
