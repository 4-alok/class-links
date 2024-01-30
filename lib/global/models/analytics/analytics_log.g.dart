// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsLogImpl _$$AnalyticsLogImplFromJson(Map<String, dynamic> json) =>
    _$AnalyticsLogImpl(
      refId: json['refId'] as String? ?? null,
      id: json['id'] as String,
      slot: json['slot'] as int? ?? 1,
      batch: json['batch'] as String,
      stream: json['stream'] as String,
      year: json['year'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$AnalyticsLogImplToJson(_$AnalyticsLogImpl instance) =>
    <String, dynamic>{
      'refId': instance.refId,
      'id': instance.id,
      'slot': instance.slot,
      'batch': instance.batch,
      'stream': instance.stream,
      'year': instance.year,
      'date': instance.date.toIso8601String(),
    };

_$ThemeUsageLogImpl _$$ThemeUsageLogImplFromJson(Map<String, dynamic> json) =>
    _$ThemeUsageLogImpl(
      isBlack: json['isBlack'] as bool? ?? null,
      themeModeLight: json['themeModeLight'] as bool? ?? null,
      themeName: json['themeName'] as String,
    );

Map<String, dynamic> _$$ThemeUsageLogImplToJson(_$ThemeUsageLogImpl instance) =>
    <String, dynamic>{
      'isBlack': instance.isBlack,
      'themeModeLight': instance.themeModeLight,
      'themeName': instance.themeName,
    };
