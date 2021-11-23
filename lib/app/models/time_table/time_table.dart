import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_table.freezed.dart';
part 'time_table.g.dart';

@freezed
abstract class TimeTable with _$TimeTable {
  const factory TimeTable({
    required List<Day> week,
    required String creatorId,
    required String batch,
    required int year,
    required DateTime date,
  }) = _TimeTable;

  factory TimeTable.fromJson(Map<String, dynamic> json) =>
      _$TimeTableFromJson(json);
}

@freezed
abstract class Day with _$Day {
  const factory Day({
    required String day,
    required List<Subject> subjects,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) =>
      _$DayFromJson(json);
}

@freezed
abstract class Subject with _$Subject {
  const factory Subject({
    required String subjectName,
    required String remark,
    required DateTime startTime,

  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}