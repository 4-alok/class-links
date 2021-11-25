// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      id: json['id'] as String,
      slot: json['slot'] as int,
      batch: json['batch'] as String,
      year: json['year'] as int,
      date: DateTime.parse(json['date'] as String),
      role: json['role'] as String? ?? 'user',
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slot': instance.slot,
      'batch': instance.batch,
      'year': instance.year,
      'date': instance.date.toIso8601String(),
      'role': instance.role,
    };
