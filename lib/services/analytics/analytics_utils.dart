import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../hive/repository/hive_database.dart';

mixin AnalyticsUtile {
  final hiveDatabase = Get.find<HiveDatabase>();

  bool? get isBlack =>
      (hiveDatabase.settingBoxDatasources.themeMode.value == ThemeMode.dark)
          ? hiveDatabase.settingBoxDatasources.isBlack.value
          : null;

  bool? get themeModeLight {
    if (hiveDatabase.settingBoxDatasources.themeMode.value == ThemeMode.dark) {
      return false;
    } else if (hiveDatabase.settingBoxDatasources.themeMode.value ==
        ThemeMode.light) {
      return true;
    } else {
      return null;
    }
  }
}
