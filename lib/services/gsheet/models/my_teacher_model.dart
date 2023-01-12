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

  factory MyTeachers.fromMap(Map<String, dynamic> map) => MyTeachers(
        batch: map['batch'] as String,
        teachers: List<Teacher>.from(
          (map['teachers'] as List<dynamic>).map<Teacher>(
            (x) => Teacher.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

  String toJson() => json.encode(toMap());

  factory MyTeachers.fromJson(String source) =>
      MyTeachers.fromMap(json.decode(source) as Map<String, dynamic>);

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
  final String name;
  final String subject;
  const Teacher({required this.name, required this.subject});

  Teacher copyWith({String? name, String? subject}) =>
      Teacher(name: name ?? this.name, subject: subject ?? this.subject);

  Map<String, dynamic> toMap() =>
      <String, dynamic>{'name': name, 'subject': subject};

  factory Teacher.fromMap(Map<String, dynamic> map) =>
      Teacher(name: map['name'] as String, subject: map['subject'] as String);

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) =>
      Teacher.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Teacher(name: $name, subject: $subject)';

  @override
  bool operator ==(covariant Teacher other) => (identical(this, other))
      ? true
      : other.name == name && other.subject == subject;

  @override
  int get hashCode => name.hashCode ^ subject.hashCode;
}
