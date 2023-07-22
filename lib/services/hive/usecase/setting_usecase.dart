import 'package:flutter/material.dart';

abstract class SettingBoxUsecase {
  // Themes Settings
  Future<void> get setTheme;
  Future<void> saveCurrentSchemeIndex(int index);
  Future<int> get getCurrentSchemeIndex;
  Future<void> saveCurrentTheme(ThemeMode themeMode);
  Future<ThemeMode> get getCurrentTheme;
  Future<void> saveIsBlackMode(bool isBlack);
  Future<bool> get getIsBlack;
  Future<void> toggleThemeMode();

  // Build Settings
  Future<String?> get buildNo;
  Future<void> setBuildNo();

  // Resource Only
  Future<void> saveIsResourceOnly(bool isResourceOnly);
  Future<bool> get getIsResourceOnly;
}
