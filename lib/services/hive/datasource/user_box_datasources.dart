import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/user_info.dart';
import '../usecase/user_usecase.dart';

class UserBoxDatasourcse implements UserBoxUsecase {
  final Box userInfoBox;
  UserBoxDatasourcse(this.userInfoBox);

  UserInfo? userInfo;

  Future<void> get init async {
    userInfo = await getUserInfo;
  }

  /// Clear user info from the box and set it to null.
  @override
  Future<void> get clearUserInfo async =>
      await userInfoBox.clear().then((value) => userInfo = null);

  /// Get user info from the box.
  @override
  Future<UserInfo?> get getUserInfo async => (userInfoBox.isEmpty)
      ? null
      : UserInfo.fromJson(jsonDecode(await userInfoBox.values.first));

  /// [userInfo] is the user info to be stored in the box.
  /// Clear the box and store the new user info.
  @override
  Future<void> setUserInfo(UserInfo userInfo) async {
    this.userInfo = userInfo;
    if (userInfoBox.isEmpty) {
      await _add(jsonEncode(userInfo.toJson()));
    } else {
      await userInfoBox.clear();
      await _add(jsonEncode(userInfo.toJson()));
    }
  }

  Future<void> _add(String data) async => await userInfoBox.put(0, data);
}
