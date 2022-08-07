import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/theme/app_color.dart.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/hive/repository/hive_database.dart';

class ProfileController extends GetxController {
  final scrollController = ScrollController();
  final hiveDatabase = Get.find<HiveDatabase>();

  bool get isBlack => hiveDatabase.settingBoxDatasources.isBlack.value;

  static const double _kWidthOfScrollItem = 67.2;

  @override
  void onReady() {
    final appTheme = hiveDatabase.settingBoxDatasources.appTheme.value;
    final index = AppColor.schemes.indexWhere((element) => element == appTheme);
    if ((AppColor.schemes.length - index) >=
        (Get.width / _kWidthOfScrollItem) - 1) {
      scrollController.animateTo(
        _kWidthOfScrollItem * index,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
    super.onReady();
  }

  Future<void> toggleThemeMode() async {
    await hiveDatabase.settingBoxDatasources
        .saveCurrentTheme(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark)
        .then((value) {
      hiveDatabase.settingBoxDatasources.themeMode.update((val) => hiveDatabase
          .settingBoxDatasources
          .themeMode
          .value = Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    });
  }

  Future<void> logout() async {
    final authService = Get.find<AuthService>();
    await authService.logout;
    await Get.find<HiveDatabase>().userBoxDatasources.clearUserInfo;
    Get.offAllNamed(Routes.AUTH);
  }

  Future<void> blackModeOnChange(bool _) async =>
      await hiveDatabase.settingBoxDatasources.saveIsBlackMode(!isBlack).then(
          (value) =>
              hiveDatabase.settingBoxDatasources.isBlack.value = !isBlack);

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
