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
    required String imgUrl,
    @Default(null) String? logoUrl,
    required DateTime dateTime,
    @Default([]) List<int> interested,
    required bool verified,
    @Default(null) String? launchURL,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
