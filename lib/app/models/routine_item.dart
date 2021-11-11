import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_item.freezed.dart';
part 'routine_item.g.dart';

@freezed
abstract class RoutineItem with _$RoutineItem {
  const factory RoutineItem({
    required String id,
    required String batch,
    required String day,
    required String subject,
    required String time,
    @Default(null) String? classlink,
    @Default(null) String? classLinkCreater,
    @Default(null) String? grpLink,
    @Default(null) String? grpLinkCreater,
    @Default(null) String? notice,
  }) = _RoutineItem;

  factory RoutineItem.fromJson(Map<String, dynamic> json) =>
      _$RoutineItemFromJson(json);
}