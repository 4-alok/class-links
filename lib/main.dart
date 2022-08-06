import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'di.dart' as di;
import 'global/transition_animation.dart/shared_axis_scale_transition.dart';
import 'routes/app_pages.dart';
import 'services/hive/repository/hive_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded<Future<void>>(
    () async => await di.init.then((_) => runApp(
          const ClassLink(),
        )),
    (error, stackTrace) =>
        {debugPrint("Error# $error "), debugPrint("StackTrace# $stackTrace")},
  );
}

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
          blendLevel: 40,
          fontFamily: GoogleFonts.poppins().fontFamily,
          subThemesData: const FlexSubThemesData(blendTextTheme: false),
          colors: database.settingBox.appTheme.value.light,
          appBarStyle: database.appBarStyle.value,
          useSubThemes: true,
        ),
        darkTheme: FlexThemeData.dark(
          blendLevel: 40,
          fontFamily: GoogleFonts.poppins().fontFamily,
          subThemesData: const FlexSubThemesData(blendTextTheme: false),
          darkIsTrueBlack: database.settingBox.isBlack.value,
          colors: database.settingBox.appTheme.value.dark,
          appBarStyle: database.appBarStyle.value,
          useSubThemes: true,
        ),
        themeMode: database.settingBox.themeMode.value,
        customTransition: SharedAxisScaleTransition(),
      ),
    );
  }
}
