import 'package:flutter/material.dart';

abstract class SettingBoxUsecase {
  Future<void> get setTheme;
  Future<void> saveCurrentSchemeIndex(int index);
  Future<int> get getCurrentSchemeIndex;
  Future<void> saveCurrentTheme(ThemeMode themeMode);
  Future<ThemeMode> get getCurrentTheme;
  Future<void> saveIsBlackMode(bool isBlack);
  Future<bool> get getIsBlack;
  Future<void> toggleThemeMode();
}
