import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/global/transition_animation.dart/shared_axis_scale_transition.dart';
import 'app/routes/app_pages.dart';
import 'app/services/hive/hive_database.dart';
import 'di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded<Future<void>>(
    () async => await di.init().then((_) => runApp(
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
            colors: database.appTheme.value.light,
            // useSubThemes: true,
            appBarStyle: database.appBarStyle.value),
        darkTheme: FlexThemeData.dark(
          blendLevel: 40,
          fontFamily: GoogleFonts.poppins().fontFamily,
          subThemesData: const FlexSubThemesData(blendTextTheme: false),
          darkIsTrueBlack: database.isBlack.value,
          colors: database.appTheme.value.dark,
          appBarStyle: database.appBarStyle.value,
          useSubThemes: true,
        ),
        themeMode: database.themeMode.value,
        customTransition: SharedAxisScaleTransition(),
      ),
    );
  }
}
