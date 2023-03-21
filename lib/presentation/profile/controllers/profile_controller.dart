import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/theme/app_color.dart.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../global/const/app_info.dart';

class ProfileController extends GetxController {
  final scrollController = ScrollController();
  final hiveDatabase = Get.find<HiveDatabase>();

  bool get isBlack => hiveDatabase.settingBoxDatasources.isBlack.value;

  static const double _kWidthOfScrollItem = 67.2;

  @override

  /// > When the widget is ready, it will scroll to the current theme color
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

  /// It toggles the theme mode.
  Future<void> toggleThemeMode() async =>
      await hiveDatabase.settingBoxDatasources.toggleThemeMode();

  /// > It logs out the user, clears the user info from the database, and navigates to the auth screen
  Future<void> logout() async {
    final authService = Get.find<AuthService>();
    await authService.logout;
    await Get.find<HiveDatabase>().userBoxDatasources.clearUserInfo;
    Get.offAllNamed(Routes.AUTH);
  }

  Future<void> blackModeOnChange(bool value) async =>
      await hiveDatabase.settingBoxDatasources.blackModeOnChange(value);

  Future<String> get getAppVersion async => await AppInfo.appVersion;

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
