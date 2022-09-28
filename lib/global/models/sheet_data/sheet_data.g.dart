// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SheetData _$$_SheetDataFromJson(Map<String, dynamic> json) => _$_SheetData(
      rowList: (json['rowList'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$$_SheetDataToJson(_$_SheetData instance) =>
    <String, dynamic>{
      'rowList': instance.rowList,
    };
