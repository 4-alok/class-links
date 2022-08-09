// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      docId: json['docId'] as String? ?? null,
      id: json['id'] as String,
      userId: json['userId'] as String,
      reportType: $enumDecode(_$ReportTypeEnumMap, json['reportType']),
      description: json['description'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      attatchmentUrl: json['attatchmentUrl'] as String? ?? null,
      reply: json['reply'] as String? ?? null,
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'docId': instance.docId,
      'id': instance.id,
      'userId': instance.userId,
      'reportType': _$ReportTypeEnumMap[instance.reportType]!,
      'description': instance.description,
      'dateTime': instance.dateTime.toIso8601String(),
      'attatchmentUrl': instance.attatchmentUrl,
      'reply': instance.reply,
    };

const _$ReportTypeEnumMap = {
  ReportType.wrongTimetable: 'wrongTimetable',
  ReportType.bug: 'bug',
  ReportType.suggestion: 'suggestion',
  ReportType.other: 'other',
};
