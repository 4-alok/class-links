import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String id,
    @Default(1) int slot,
    required String batch,
    required int year,
    required DateTime date,
    @Default('user') String role,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
