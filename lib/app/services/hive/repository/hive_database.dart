import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../datasource/setting_box_datasources.dart';
import '../datasource/user_box_datasources.dart';
import '../theme_analytics_log.dart';

class HiveDatabase extends GetxService with ThemeAnalyticsLog {
  final appBarStyle = Rx<FlexAppBarStyle>(FlexAppBarStyle.material);
  late final Box userInfoBox;
  late final Box settingsBox;

  late final SettingBoxDatasources settingBox;
  late final UserBoxDatasourcse userBox;

  Future<void> get initDatabase async {
    userInfoBox = await Hive.openBox('userInfo');
    settingsBox = await Hive.openBox('settings');
    settingBox = SettingBoxDatasources(settingsBox);
    userBox = UserBoxDatasourcse(userInfoBox);
    await userBox.init;
    await settingBox.setTheme;
  }

  @override
  Future<void> onClose() async {
    await userInfoBox.close();
    await settingsBox.close();
    settingBox.dispose;
    super.onClose();
  }
}
