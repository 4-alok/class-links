import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'di.dart' as di;
import 'global/transition_animation.dart/shared_axis_scale_transition.dart';
import 'routes/app_pages.dart';
import 'services/hive/repository/hive_database.dart';

// ignore: constant_identifier_names
// const TEST_MODE = false;
// const TEST_MODE = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init.then((_) => runApp(const ClassLink()));
}

class ClassLink extends StatelessWidget {
  const ClassLink({super.key});

  @override
  Widget build(BuildContext context) {
    final HiveDatabase database = Get.find<HiveDatabase>();
    return GetX<HiveDatabase>(
      builder: (_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Class Link",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: FlexThemeData.light(
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 9,
          appBarStyle: FlexAppBarStyle.material,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily,
          colors: database.settingBoxDatasources.appTheme.value.light,
        ),
        darkTheme: FlexThemeData.dark(
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 15,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily,
          darkIsTrueBlack: database.settingBoxDatasources.isBlack.value,
          colors: database.settingBoxDatasources.appTheme.value.dark,
        ),
        // themeMode: ThemeMode.light,
        themeMode: database.settingBoxDatasources.themeMode.value,
        customTransition: SharedAxisScaleTransition(),
      ),
    );
  }
}
