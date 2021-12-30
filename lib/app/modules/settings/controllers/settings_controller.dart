import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Future<void> toogleThemeMode() async {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
