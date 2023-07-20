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
const TEST_MODE = false;

/// `runZonedGuarded` is a function that runs the `runApp` function in a zone that catches any errors
/// that occur in the `runApp` function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runZonedGuarded<Future<void>>(
  //   () async =>
  await di.init.then((_) => runApp(
        const ClassLink(),
      ));
  //   (error, stackTrace) =>
  //       {debugPrint("Error# $error "), debugPrint("StackTrace# $stackTrace")},
  // );
}

/// The statement describes a Flutter application that is utilizing the GetMaterialApp
/// widget to create a custom transition and theme mode that changes according to the
/// user's choice. The application is also using various packages such as GetX,
/// FlexColorScheme, GoogleFonts, Animations,HiveDatabase, and GetX to enhance its
/// functionality. These packages are used for listening to changes in the database,
/// providing dependency injection, state management, reactive navigation, custom theme,
/// font, transition, routes, and database.
class ClassLink extends StatelessWidget {
  const ClassLink({Key? key}) : super(key: key);

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
        themeMode: database.settingBoxDatasources.themeMode.value,
        customTransition: SharedAxisScaleTransition(),
      ),
    );
  }
}
