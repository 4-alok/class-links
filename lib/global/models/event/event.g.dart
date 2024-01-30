// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      refId: json['refId'] as String? ?? "",
      title: json['title'] as String,
      description: json['description'] as String,
      creatorId: json['creatorId'] as String,
      creatorName: json['creatorName'] as String,
      imgUrl: json['imgUrl'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      logoUrl: json['logoUrl'] as String? ?? null,
      interested: (json['interested'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      verified: json['verified'] as bool? ?? false,
      launchURL: json['launchURL'] as String? ?? null,
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'refId': instance.refId,
      'title': instance.title,
      'description': instance.description,
      'creatorId': instance.creatorId,
      'creatorName': instance.creatorName,
      'imgUrl': instance.imgUrl,
      'dateTime': instance.dateTime.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'logoUrl': instance.logoUrl,
      'interested': instance.interested,
      'verified': instance.verified,
      'launchURL': instance.launchURL,
    };
