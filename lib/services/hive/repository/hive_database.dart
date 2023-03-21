import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../datasource/cache_box_datasources.dart';
import '../datasource/setting_box_datasources.dart';
import '../datasource/user_box_datasources.dart';
import '../utils/theme_analytics_log.dart';

/// It's a class that manages the Hive database and provides the data sources for the boxes

class HiveDatabase extends GetxService with ThemeAnalyticsLog {
  late final Box userInfoBox;
  late final Box settingsBox;
  late final Box cacheBox;

  late final SettingBoxDatasources settingBoxDatasources;
  late final UserBoxDatasourcse userBoxDatasources;
  late final CacheBoxDataSources cacheBoxDataSources;

/// It's opening the boxes and setting the datasources for the boxes.
  Future<void> get initDatabase async {
    userInfoBox = await Hive.openBox('userInfo');
    settingsBox = await Hive.openBox('settings');
    cacheBox = await Hive.openBox('cache');
    /// It's setting the datasource for the settings box.
    settingBoxDatasources = SettingBoxDatasources(settingsBox);
    /// It's setting the datasource for the user box.
    userBoxDatasources = UserBoxDatasourcse(userInfoBox);
    /// It's setting the datasource for the cache box.
    cacheBoxDataSources = CacheBoxDataSources(cacheBox);
    await userBoxDatasources.init;
    await settingBoxDatasources.setTheme;
  }

/// It's clearing the boxes.
  Future<void> get clearBoxes async {
    await userInfoBox.clear();
    await settingsBox.clear();
    await cacheBox.clear();
  }

/// > When the database is closed, close all the boxes
  @override
  Future<void> onClose() async {
    await userInfoBox.close();
    await settingsBox.close();
    await cacheBox.close();
    settingBoxDatasources.dispose;
    super.onClose();
  }
}
