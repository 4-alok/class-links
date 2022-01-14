import 'package:freezed_annotation/freezed_annotation.dart';

part 'log.freezed.dart';

@freezed
class LogData with _$LogData {
  const factory LogData({
    required String name,
    required String email,
    required String log,
    required DateTime date,
  }) = _LogData;
}
