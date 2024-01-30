// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SheetDataImpl _$$SheetDataImplFromJson(Map<String, dynamic> json) =>
    _$SheetDataImpl(
      rowList: (json['rowList'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$$SheetDataImplToJson(_$SheetDataImpl instance) =>
    <String, dynamic>{
      'rowList': instance.rowList,
    };
