import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../datasource/cache_box_datasources.dart';
import '../datasource/setting_box_datasources.dart';
import '../datasource/user_box_datasources.dart';

/// It's a class that manages the Hive database and provides the data sources for the boxes

class HiveDatabase extends GetxService {
  late final Box userInfoBox;
  late final Box settingsBox;
  late final Box cacheBox;

  late final SettingBoxDatasources settingBoxDatasources;
  late final UserBoxDatasourcse userBoxDatasources;
  late final CacheBoxDataSources cacheBoxDataSources;


  /// Initializes the Hive database by opening three boxes: userInfo, settings, and cache.
  /// It also sets the data sources for each box and initializes them.
  /// 
  /// Example usage:
  /// ```
  /// await initDatabase();
  /// ```
  Future<void> get initDatabase async {
    userInfoBox = await Hive.openBox('userInfo');
    settingsBox = await Hive.openBox('settings');
    cacheBox = await Hive.openBox('cache');

    /// Initializes the [settingBoxDatasources] with the [settingsBox] instance.
    settingBoxDatasources = SettingBoxDatasources(settingsBox);

    /// Initializes the [userBoxDatasources] with the [userInfoBox] instance.
    userBoxDatasources = UserBoxDatasourcse(userInfoBox);

    /// Initializes the [cacheBoxDataSources] with the [cacheBox] instance.
    cacheBoxDataSources = CacheBoxDataSources(cacheBox);
    await userBoxDatasources.init;
    await settingBoxDatasources.init;
  }

  
  /// Clears all the boxes in the Hive database.
  Future<void> get clearBoxes async {
    await userInfoBox.clear();
    await settingsBox.clear();
    await cacheBox.clear();
  }

  /// Closes the [userInfoBox], [settingsBox], and [cacheBox] instances and disposes of the [settingBoxDatasources].
  /// Also calls the [onClose] method of the parent class.
  @override
  Future<void> onClose() async {
    await userInfoBox.close();
    await settingsBox.close();
    await cacheBox.close();
    settingBoxDatasources.dispose;
    super.onClose();
  }
}
