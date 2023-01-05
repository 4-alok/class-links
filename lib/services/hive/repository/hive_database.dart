import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../datasource/cache_box_datasources.dart';
import '../datasource/setting_box_datasources.dart';
import '../datasource/user_box_datasources.dart';
import '../utils/theme_analytics_log.dart';

class HiveDatabase extends GetxService with ThemeAnalyticsLog {
  late final Box userInfoBox;
  late final Box settingsBox;
  late final Box cacheBox;

  late final SettingBoxDatasources settingBoxDatasources;
  late final UserBoxDatasourcse userBoxDatasources;
  late final CacheBoxDataSources cacheBoxDataSources;

  Future<void> get initDatabase async {
    userInfoBox = await Hive.openBox('userInfo');
    settingsBox = await Hive.openBox('settings');
    cacheBox = await Hive.openBox('cache');
    settingBoxDatasources = SettingBoxDatasources(settingsBox);
    userBoxDatasources = UserBoxDatasourcse(userInfoBox);
    cacheBoxDataSources = CacheBoxDataSources(cacheBox);
    await userBoxDatasources.init;
    await settingBoxDatasources.setTheme;
  }

  Future<void> get clearBoxes async {
    await userInfoBox.clear();
    await settingsBox.clear();
    await cacheBox.clear();
  }

  @override
  Future<void> onClose() async {
    await userInfoBox.close();
    await settingsBox.close();
    await cacheBox.close();
    settingBoxDatasources.dispose;
    super.onClose();
  }
}
