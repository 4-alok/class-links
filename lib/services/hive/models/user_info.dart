import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @Default(null) String? refId,
    required String id,
    @Default(1) int slot,
    required String batch,
    required String stream,
    required int year,
    required DateTime date,
    required String userName,
    @Default('viewer') String role,
    @Default(null) int? semester,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

class UserInfoList {
  final List<UserInfo> list;
  const UserInfoList({required this.list});
}
