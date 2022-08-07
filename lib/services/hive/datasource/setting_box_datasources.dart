import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../global/theme/app_color.dart.dart';
import '../utils/theme_analytics_log.dart';
import '../usecase/setting_usecase.dart';

class SettingBoxDatasources
    with ThemeAnalyticsLog
    implements SettingBoxUsecase {
  final Box settingsBox;

  SettingBoxDatasources(this.settingsBox);

  final appTheme = Rx<FlexSchemeData>(AppColor.schemes[0]);
  final isBlack = Rx<bool>(true);
  final themeMode = Rx<ThemeMode>(ThemeMode.system);

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
        addThemeLog;
      });

  @override
  Future<void> saveCurrentTheme(ThemeMode themeMode) async => await settingsBox
      .put('mode', themeMode.index)
      .then((value) => addThemeLog);

  @override
  Future<void> saveIsBlackMode(bool isBlack) async =>
      await settingsBox.put('isBlack', isBlack).then((value) => addThemeLog);

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
}
