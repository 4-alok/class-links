import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    @Default("") String refId,
    required String title,
    required String description,
    required String creatorId,
    required String creatorName,
    required String imgUrl,
    required DateTime dateTime,
    required DateTime createdAt,
    @Default(null) String? logoUrl,
    @Default([]) List<int> interested,
    @Default(false) bool verified,
    @Default(null) String? launchURL,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
