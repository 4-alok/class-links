import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_table.freezed.dart';
part 'time_table.g.dart';



@freezed
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

@freezed
class Day with _$Day {
  const factory Day({
    required String day,
    required List<Subject> subjects,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@freezed
class Subject with _$Subject {
  const factory Subject({
    required String subjectName,
    @Default("") String subjectAddBy,
    @Default("") String remark,
    @Default("") String remarkAddBy,
    @Default("") String googleClassRoomLink,
    @Default("") String gLinkAddBy,
    @Default(null) String? roomNo,
    @Default("") String roomNoAddBy,
    @Default("") String zoomLink,
    @Default("") String zLinkAddBy,
    required DayTime startTime,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
class DayTime with _$DayTime {
  const factory DayTime({
    required int hour,
    required int minute,
  }) = _DayTime;

  factory DayTime.fromJson(Map<String, dynamic> json) =>
      _$DayTimeFromJson(json);
}
