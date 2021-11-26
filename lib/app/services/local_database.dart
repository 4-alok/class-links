import 'dart:convert';
import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveDatabase extends GetxService {
  late final Box userInfoBox;
  UserInfo? userInfo;

  Future<void> initDatabase() async {
    userInfoBox = await Hive.openBox('userInfo');
    userInfo = await getUserInfo();
  }

  Future<void> setUserInfo(UserInfo userInfo) async {
    if (userInfoBox.isEmpty) {
      await _add(jsonEncode(userInfo.toJson()));
    } else {
      await userInfoBox.clear();
      await _add(jsonEncode(userInfo.toJson()));
    }
  }

  Future<void> clearUserInfo() async => await userInfoBox.clear();

  Future<void> _add(String data) async =>
      await userInfoBox.add(data);

  Future<UserInfo?> getUserInfo() async => (await userInfoBox.isEmpty)
      ? null
      : UserInfo.fromJson(jsonDecode(await userInfoBox.values.first));
}
