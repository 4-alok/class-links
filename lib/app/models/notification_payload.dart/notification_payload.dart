import '../time_table/time_table.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_payload.freezed.dart';
part 'notification_payload.g.dart';

enum LinkType { googleMeet, zoomMeeting }

@freezed
class NotificationPayload with _$NotificationPayload {
  const factory NotificationPayload({
    required String title,
    required String body,
    required int currentWeek,
    @Default(null) LinkType? type,
    required DayTime time,
    @Default(null) String? roomNo,
    @Default(null) Subject? subject,
  }) = _NotificationPayload;

  factory NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadFromJson(json);
}
