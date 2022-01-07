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
      slot: json['slot'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_TimeTableToJson(_$_TimeTable instance) =>
    <String, dynamic>{
      'week': instance.week.map((e) => e.toJson()).toList(),
      'creatorId': instance.creatorId,
      'batch': instance.batch,
      'year': instance.year,
      'slot': instance.slot,
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
      subjectAddBy: json['subjectAddBy'] as String? ?? "",
      remark: json['remark'] as String? ?? "",
      remarkAddBy: json['remarkAddBy'] as String? ?? "",
      googleClassRoomLink: json['googleClassRoomLink'] as String? ?? "",
      gLinkAddBy: json['gLinkAddBy'] as String? ?? "",
      roomNo: json['roomNo'] as int? ?? null,
      roomNoAddBy: json['roomNoAddBy'] as String? ?? "",
      zoomLink: json['zoomLink'] as String? ?? "",
      zLinkAddBy: json['zLinkAddBy'] as String? ?? "",
      startTime: DayTime.fromJson(json['startTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SubjectToJson(_$_Subject instance) =>
    <String, dynamic>{
      'subjectName': instance.subjectName,
      'subjectAddBy': instance.subjectAddBy,
      'remark': instance.remark,
      'remarkAddBy': instance.remarkAddBy,
      'googleClassRoomLink': instance.googleClassRoomLink,
      'gLinkAddBy': instance.gLinkAddBy,
      'roomNo': instance.roomNo,
      'roomNoAddBy': instance.roomNoAddBy,
      'zoomLink': instance.zoomLink,
      'zLinkAddBy': instance.zLinkAddBy,
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
