// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      refId: json['refId'] as String? ?? null,
      id: json['id'] as String,
      slot: json['slot'] as int? ?? 1,
      batch: json['batch'] as String,
      stream: json['stream'] as String,
      year: json['year'] as int,
      date: DateTime.parse(json['date'] as String),
      userName: json['userName'] as String,
      role: json['role'] as String? ?? 'user',
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'refId': instance.refId,
      'id': instance.id,
      'slot': instance.slot,
      'batch': instance.batch,
      'stream': instance.stream,
      'year': instance.year,
      'date': instance.date.toIso8601String(),
      'userName': instance.userName,
      'role': instance.role,
    };
