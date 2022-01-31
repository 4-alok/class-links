import 'dart:convert';
import '../global/theme/app_color.dart.dart';
import '../models/user_info/user_info.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveDatabase extends GetxService {
  final appTheme = Rx<FlexSchemeData>(AppColor.schemes[1]);
  final isBlack = Rx<bool>(false);
  final themeMode = Rx<ThemeMode>(ThemeMode.system);
  final appbarStyle = Rx<FlexAppBarStyle>(FlexAppBarStyle.material);
  late final Box userInfoBox;
  late final Box settingsBox;

  UserInfo? userInfo;

  Future<void> initDatabase() async {
    userInfoBox = await Hive.openBox('userInfo');
    settingsBox = await Hive.openBox('settings');
    userInfo = await getUserInfo;
    await setTheme();
  }

  // ---------------User-----------------
  Future<void> setUserInfo(UserInfo userInfo) async {
    this.userInfo = userInfo;
    if (userInfoBox.isEmpty) {
      await _add(jsonEncode(userInfo.toJson()));
    } else {
      await userInfoBox.clear();
      await _add(jsonEncode(userInfo.toJson()));
    }
  }

  Future<void> clearUserInfo() async =>
      await userInfoBox.clear().then((value) => userInfo = null);

  Future<void> _add(String data) async => await userInfoBox.put(0, data);

  Future<UserInfo?> get getUserInfo async => (userInfoBox.isEmpty)
      ? null
      : UserInfo.fromJson(jsonDecode(await userInfoBox.values.first));

  // ---------------Settings-----------------
  Future<void> setTheme() async {
    themeMode.value = await getCurrentTheme;
    isBlack.value = await getIsBlack;
    appTheme.value = AppColor.schemes[await getCurrentSchemeIndex];
  }

  Future<void> saveCurrentSchemeIndex(int index) async => await settingsBox
      .put('currentScheme', index)
      .then((value) => appTheme.value = AppColor.schemes[index]);

  Future<int> get getCurrentSchemeIndex async =>
      await settingsBox.get('currentScheme') ?? 1;

  Future<void> saveCurrentTheme(ThemeMode themeMode) async =>
      await settingsBox.put('mode', themeMode.index);

  Future<ThemeMode> get getCurrentTheme async =>
      ThemeMode.values[await settingsBox.get('mode') ?? 0];

  Future<void> saveIsBlackMode(bool isBlack) async =>
      await settingsBox.put('isBlack', isBlack);

  Future<bool> get getIsBlack async =>
      await settingsBox.get('isBlack') ?? false;
}
