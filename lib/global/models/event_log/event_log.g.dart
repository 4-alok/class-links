// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventLogImpl _$$EventLogImplFromJson(Map<String, dynamic> json) =>
    _$EventLogImpl(
      eventCount: json['eventCount'] as int,
      refIds: (json['refIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EventLogImplToJson(_$EventLogImpl instance) =>
    <String, dynamic>{
      'eventCount': instance.eventCount,
      'refIds': instance.refIds,
    };
