import 'dart:convert';
import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

const String USER_INFO = 'user_info';

class HiveDatabase extends GetxService {
  late final Box userInfo;

  Future<void> initDatabase() async =>
      userInfo = await Hive.openBox('userInfo');

  Future<void> setUserInfo(UserInfo userInfo) async {
    if (this.userInfo.isEmpty) {
      await _add(jsonEncode(userInfo.toJson()));
    } else {
      await this.userInfo.clear();
      await _add(jsonEncode(userInfo.toJson()));
    }
  }

  Future<void> _add(String data) async =>
      await this.userInfo.put(USER_INFO, data);

  Future<UserInfo?> getUserInfo() async => (await userInfo.isEmpty)
      ? null
      : UserInfo.fromJson(jsonDecode(await userInfo.values.first));
}
