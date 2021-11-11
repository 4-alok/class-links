// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutineItem _$$_RoutineItemFromJson(Map<String, dynamic> json) =>
    _$_RoutineItem(
      id: json['id'] as String,
      batch: json['batch'] as String,
      day: json['day'] as String,
      subject: json['subject'] as String,
      time: json['time'] as String,
      classlink: json['classlink'] as String? ?? null,
      classLinkCreater: json['classLinkCreater'] as String? ?? null,
      grpLink: json['grpLink'] as String? ?? null,
      grpLinkCreater: json['grpLinkCreater'] as String? ?? null,
      notice: json['notice'] as String? ?? null,
    );

Map<String, dynamic> _$$_RoutineItemToJson(_$_RoutineItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch': instance.batch,
      'day': instance.day,
      'subject': instance.subject,
      'time': instance.time,
      'classlink': instance.classlink,
      'classLinkCreater': instance.classLinkCreater,
      'grpLink': instance.grpLink,
      'grpLinkCreater': instance.grpLinkCreater,
      'notice': instance.notice,
    };
