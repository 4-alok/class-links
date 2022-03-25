import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_log.freezed.dart';
part 'analytics_log.g.dart';

@freezed
class AnalyticsLog with _$AnalyticsLog {
  const factory AnalyticsLog({
    @Default(null) String? refId,
    required String id,
    @Default(1) int slot,
    required String batch,
    required String stream,
    required int year,
    required DateTime date,
  }) = _AnalyticsLog;

  factory AnalyticsLog.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsLogFromJson(json);
}

@freezed
class ThemeUsageLog with _$ThemeUsageLog {
  const factory ThemeUsageLog({
    @Default(null) bool? isBlack,
    @Default(null) bool? themeModeLight,
    required String themeName,
  }) = _ThemeUsageLog;

  factory ThemeUsageLog.fromJson(Map<String, dynamic> json) =>
      _$ThemeUsageLogFromJson(json);
}
