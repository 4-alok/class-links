// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationPayload _$$_NotificationPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationPayload(
      title: json['title'] as String,
      body: json['body'] as String,
      currentWeek: json['currentWeek'] as int,
      type: $enumDecodeNullable(_$LinkTypeEnumMap, json['type']) ?? null,
      time: DayTime.fromJson(json['time'] as Map<String, dynamic>),
      roomNo: json['roomNo'] as String? ?? null,
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationPayloadToJson(
        _$_NotificationPayload instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'currentWeek': instance.currentWeek,
      'type': _$LinkTypeEnumMap[instance.type],
      'time': instance.time.toJson(),
      'roomNo': instance.roomNo,
      'subject': instance.subject?.toJson(),
    };

const _$LinkTypeEnumMap = {
  LinkType.googleMeet: 'googleMeet',
  LinkType.zoomMeeting: 'zoomMeeting',
};
