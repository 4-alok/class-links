import 'dart:convert';
import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveDatabase extends GetxService {
  final appTheme = Rx<FlexSchemeData>(FlexColor.blueWhale);
  final isBlack = Rx<bool>(false);
  final appbarStyle = Rx<FlexAppBarStyle>(FlexAppBarStyle.material);
  late final Box userInfoBox;
  late final Box settingsBox;

  UserInfo? userInfo;

  Future<void> initDatabase() async {
    userInfoBox = await Hive.openBox('userInfo');
    settingsBox = await Hive.openBox('settings');
    userInfo = await getUserInfo();
  }

  // ---------------User-----------------

  Future<void> setUserInfo(UserInfo userInfo) async {
    if (userInfoBox.isEmpty) {
      await _add(jsonEncode(userInfo.toJson()));
    } else {
      await userInfoBox.clear();
      await _add(jsonEncode(userInfo.toJson()));
    }
  }

  Future<void> clearUserInfo() async => await userInfoBox.clear();

  Future<void> _add(String data) async => await userInfoBox.add(data);

  Future<UserInfo?> getUserInfo() async => (userInfoBox.isEmpty)
      ? null
      : UserInfo.fromJson(jsonDecode(await userInfoBox.values.first));

  // ---------------Settings-----------------

  // Future<void> saveCurrentScheme(FlexScheme scheme) async => await settingsBox
  //     .put('scheme', scheme.string)
  //     .then((value) => appScheme = scheme);

  // Future<void> saveCurrentTheme(ThemeModes mode) async => await settingsBox
  //     .put('mode', mode.string)
  //     .then((value) => themeMode = mode);

  // Future<List> getCurrentTheme() async {
  //   final scheme = ((await settingsBox.get('scheme') as String?) ?? "blueWhale")
  //       .flexScheme;
  //   final mode =
  //       ((await settingsBox.get('mode') as String?) ?? "other").themeModes;
  //   return [scheme, mode];
  // }
}
