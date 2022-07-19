import '../hive/repository/hive_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AnalyticsUtile {
  final hiveDatabase = Get.find<HiveDatabase>();

  bool? get isBlack => (hiveDatabase.settingBox.themeMode.value == ThemeMode.dark)
      ? hiveDatabase.settingBox.isBlack.value
      : null;

  bool? get themeModeLight {
    if (hiveDatabase.settingBox.themeMode.value == ThemeMode.dark) {
      return false;
    } else if (hiveDatabase.settingBox.themeMode.value == ThemeMode.light) {
      return true;
    } else {
      return null;
    }
  }
}
