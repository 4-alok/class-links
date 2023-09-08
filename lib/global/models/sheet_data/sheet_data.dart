import 'package:freezed_annotation/freezed_annotation.dart';

part 'sheet_data.freezed.dart';
part 'sheet_data.g.dart';

@freezed
class SheetData with _$SheetData {
  const factory SheetData({
    required List<List<String>> rowList,
  }) = _SheetData;

  factory SheetData.fromJson(Map<String, dynamic> json) =>
      _$SheetDataFromJson(json);
}