// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventLog _$$_EventLogFromJson(Map<String, dynamic> json) => _$_EventLog(
      eventCount: json['eventCount'] as int,
      refIds: (json['refIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_EventLogToJson(_$_EventLog instance) =>
    <String, dynamic>{
      'eventCount': instance.eventCount,
      'refIds': instance.refIds,
    };
