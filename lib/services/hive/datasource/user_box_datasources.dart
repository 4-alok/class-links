import 'dart:convert';

import '../../../app/models/user_info/user_info.dart';
import 'package:hive/hive.dart';

import '../usecase/user_usecase.dart';

class UserBoxDatasourcse implements UserBoxUsecase {
  final Box userInfoBox;
  UserBoxDatasourcse(this.userInfoBox);

  UserInfo? userInfo;

  Future<void> get init async => userInfo = await getUserInfo;

  @override
  Future<void> get clearUserInfo async =>
      await userInfoBox.clear().then((value) => userInfo = null);

  @override
  Future<UserInfo?> get getUserInfo async => (userInfoBox.isEmpty)
      ? null
      : UserInfo.fromJson(jsonDecode(await userInfoBox.values.first));

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
