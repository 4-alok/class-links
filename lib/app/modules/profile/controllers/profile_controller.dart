import 'package:class_link/app/global/theme/app_color.dart.dart';
import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/local_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final scrollController = ScrollController();

  static const double _kWidthOfScrollItem = 67.2;

  @override
  void onReady() {
    final appTheme = Get.find<HiveDatabase>().appTheme.value;
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

  Future<void> toogleThemeMode() async {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  Future<void> logout() async {
    final _authService = Get.find<AuthService>();
    await _authService.logout();
    await Get.find<HiveDatabase>().clearUserInfo();
    Get.offAllNamed(Routes.AUTH);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
