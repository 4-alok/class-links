import 'package:class_link/global/const/app_info.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../global/theme/app_color.dart.dart';
import '../usecase/setting_usecase.dart';

const _buildNo = 'buildNo';

class SettingBoxDatasources
    implements SettingBoxUsecase {
  final Box settingsBox;

  SettingBoxDatasources(this.settingsBox);

  final appTheme = Rx<FlexSchemeData>(AppColor.schemes[0]);
  final isBlack = Rx<bool>(true);
  final themeMode = Rx<ThemeMode>(ThemeMode.system);
  final isResourceOnly = Rx<bool>(false);

  Future<void> get init async {
    await setTheme;
    isResourceOnly.value = await getIsResourceOnly;
  }

  /// It saves the value of the boolean isBlack.value to the hive and then changes the value
  /// of isBlack.value to the opposite of what it was.
  ///
  /// Args:
  ///   value (bool): The value of the switch.
  Future<void> blackModeOnChange(bool value) async =>
      await saveIsBlackMode(!isBlack.value).then(
        (value) => isBlack.value = !isBlack.value,
      );

  /// It toggles the theme mode.
  @override
  Future<void> toggleThemeMode() async =>
      await saveCurrentTheme(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark)
          .then(
        (value) => themeMode.update((val) => themeMode.value =
            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark),
      );

  @override
  Future<int> get getCurrentSchemeIndex async =>
      await settingsBox.get('currentScheme') ?? 1;

  @override
  Future<ThemeMode> get getCurrentTheme async =>
      ThemeMode.values[await settingsBox.get('mode') ?? 0];

  @override
  Future<bool> get getIsBlack async =>
      await settingsBox.get('isBlack') ?? false;

  @override
  Future<void> saveCurrentSchemeIndex(int index) async =>
      await settingsBox.put('currentScheme', index).then((value) {
        appTheme.value = AppColor.schemes[index];
        // addThemeLog;
      });

  @override
  Future<void> saveCurrentTheme(ThemeMode themeMode) async => await settingsBox
      .put('mode', themeMode.index);
  @override
  Future<void> saveIsBlackMode(bool isBlack) async =>
      await settingsBox.put('isBlack', isBlack);

  @override
  Future<void> get setTheme async {
    themeMode.value = await getCurrentTheme;
    isBlack.value = await getIsBlack;
    appTheme.value = AppColor.schemes[await getCurrentSchemeIndex];
  }

  void get dispose {
    appTheme.close();
    isBlack.close();
    themeMode.close();
  }

  @override
  Future<String?> get buildNo async => await settingsBox.get(_buildNo);

  //TODO Remove
  // clearBuldNo() async => await settingsBox.delete(_buildNo);

  @override
  Future<void> setBuildNo() async =>
      await settingsBox.put(_buildNo, await AppInfo.buildNumber);

  @override
  Future<bool> get getIsResourceOnly async =>
      await settingsBox.get('isResourceOnly') ?? false;

  @override
  Future<void> saveIsResourceOnly(bool isResourceOnly) async =>
      await settingsBox.put('isResourceOnly', isResourceOnly);
}
