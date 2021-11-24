// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeTable _$$_TimeTableFromJson(Map<String, dynamic> json) => _$_TimeTable(
      week: (json['week'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
      creatorId: json['creatorId'] as String,
      batch: json['batch'] as String,
      year: json['year'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_TimeTableToJson(_$_TimeTable instance) =>
    <String, dynamic>{
      'week': instance.week.map((e) => e.toJson()).toList(),
      'creatorId': instance.creatorId,
      'batch': instance.batch,
      'year': instance.year,
      'date': instance.date.toIso8601String(),
    };

_$_Day _$$_DayFromJson(Map<String, dynamic> json) => _$_Day(
      day: json['day'] as String,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DayToJson(_$_Day instance) => <String, dynamic>{
      'day': instance.day,
      'subjects': instance.subjects.map((e) => e.toJson()).toList(),
    };

_$_Subject _$$_SubjectFromJson(Map<String, dynamic> json) => _$_Subject(
      subjectName: json['subjectName'] as String,
      remark: json['remark'] as String,
      startTime: DayTime.fromJson(json['startTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SubjectToJson(_$_Subject instance) =>
    <String, dynamic>{
      'subjectName': instance.subjectName,
      'remark': instance.remark,
      'startTime': instance.startTime.toJson(),
    };

_$_DayTime _$$_DayTimeFromJson(Map<String, dynamic> json) => _$_DayTime(
      hour: json['hour'] as int,
      minute: json['minute'] as int,
    );

Map<String, dynamic> _$$_DayTimeToJson(_$_DayTime instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
    };
