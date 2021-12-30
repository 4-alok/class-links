import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ThemeBuilder {
  static ThemeData build(FlexSchemeData schemeData) => (Get.isDarkMode)
      ? FlexThemeData.dark(
          colors: schemeData.dark,
          // appBarBackground: Colors.white,
          useSubThemes: true,
        )
      : FlexThemeData.light(
          colors: schemeData.light,
          appBarBackground: Colors.white,
          useSubThemes: true,
        );
}
