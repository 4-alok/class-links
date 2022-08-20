import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_log.freezed.dart';
part 'event_log.g.dart';

@freezed
class EventLog with _$EventLog {
  const factory EventLog({
    required int eventCount,
    @Default([]) List<String> refIds,
  }) = _EventLog;

  factory EventLog.fromJson(Map<String, dynamic> json) =>
      _$EventLogFromJson(json);
}