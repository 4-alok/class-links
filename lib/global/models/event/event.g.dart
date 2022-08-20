// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      refId: json['refId'] as String? ?? "",
      title: json['title'] as String,
      description: json['description'] as String,
      creatorId: json['creatorId'] as String,
      imgUrl: json['imgUrl'] as String,
      logoUrl: json['logoUrl'] as String? ?? null,
      dateTime: DateTime.parse(json['dateTime'] as String),
      interested: (json['interested'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      verified: json['verified'] as bool,
      launchURL: json['launchURL'] as String? ?? null,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'refId': instance.refId,
      'title': instance.title,
      'description': instance.description,
      'creatorId': instance.creatorId,
      'imgUrl': instance.imgUrl,
      'logoUrl': instance.logoUrl,
      'dateTime': instance.dateTime.toIso8601String(),
      'interested': instance.interested,
      'verified': instance.verified,
      'launchURL': instance.launchURL,
    };
