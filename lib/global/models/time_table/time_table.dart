import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_table.freezed.dart';
part 'time_table.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TimeTable with _$TimeTable {
  const factory TimeTable({
    required List<Day> week,
    required String creatorId,
    required String batch,
    required int year,
    required int slot,
    required DateTime date,
  }) = _TimeTable;

  factory TimeTable.fromJson(Map<String, dynamic> json) =>
      _$TimeTableFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Day with _$Day {
  const factory Day({
    required String day,
    required List<Subject> subjects,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Subject with _$Subject {
  const factory Subject({
    required String subjectName,
    @Default(null) String? roomNo,
    @Default(false) isElective,
    @Default(null) String? electiveSubjectCode,
    @Default(null) String? teacherName,
    required DayTime startTime,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: true)
class DayTime with _$DayTime {
  const factory DayTime({
    required int hour,
    required int minute,
  }) = _DayTime;

  factory DayTime.fromJson(Map<String, dynamic> json) =>
      _$DayTimeFromJson(json);
}
