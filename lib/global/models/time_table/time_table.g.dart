// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeTableImpl _$$TimeTableImplFromJson(Map<String, dynamic> json) =>
    _$TimeTableImpl(
      week: (json['week'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
      batch: json['batch'] as String,
      semester: json['semester'] as int,
    );

Map<String, dynamic> _$$TimeTableImplToJson(_$TimeTableImpl instance) =>
    <String, dynamic>{
      'week': instance.week.map((e) => e.toJson()).toList(),
      'batch': instance.batch,
      'semester': instance.semester,
    };

_$DayImpl _$$DayImplFromJson(Map<String, dynamic> json) => _$DayImpl(
      day: json['day'] as String,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DayImplToJson(_$DayImpl instance) => <String, dynamic>{
      'day': instance.day,
      'subjects': instance.subjects.map((e) => e.toJson()).toList(),
    };

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      subjectName: json['subjectName'] as String,
      roomNo: json['roomNo'] as String? ?? null,
      isElective: json['isElective'] ?? false,
      electiveSubjectCode: json['electiveSubjectCode'] as String? ?? null,
      teacherName: json['teacherName'] as String? ?? null,
      startTime: DayTime.fromJson(json['startTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubjectImplToJson(_$SubjectImpl instance) =>
    <String, dynamic>{
      'subjectName': instance.subjectName,
      'roomNo': instance.roomNo,
      'isElective': instance.isElective,
      'electiveSubjectCode': instance.electiveSubjectCode,
      'teacherName': instance.teacherName,
      'startTime': instance.startTime.toJson(),
    };

_$DayTimeImpl _$$DayTimeImplFromJson(Map<String, dynamic> json) =>
    _$DayTimeImpl(
      hour: json['hour'] as int,
      minute: json['minute'] as int,
    );

Map<String, dynamic> _$$DayTimeImplToJson(_$DayTimeImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
    };
