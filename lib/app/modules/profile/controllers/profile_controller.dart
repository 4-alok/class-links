import '../../../global/theme/app_color.dart.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/hive/hive_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final scrollController = ScrollController();
  final hiveDatabase = Get.find<HiveDatabase>();

  bool get isBlack => hiveDatabase.isBlack.value;

  static const double _kWidthOfScrollItem = 67.2;

  @override
  void onReady() {
    final appTheme = hiveDatabase.appTheme.value;
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
    await hiveDatabase
        .saveCurrentTheme(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark)
        .then((value) {
      hiveDatabase.themeMode.update((val) => hiveDatabase.themeMode.value =
          Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    });
  }

  Future<void> logout() async {
    final authService = Get.find<AuthService>();
    await authService.logout();
    await Get.find<HiveDatabase>().clearUserInfo();
    Get.offAllNamed(Routes.AUTH);
  }

  Future<void> blackModeOnChange(bool _) async => await hiveDatabase
      .saveIsBlackMode(!isBlack)
      .then((value) => hiveDatabase.isBlack.value = !isBlack);

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
