import 'dart:async';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'app/global/transition_animation.dart/shared_axis_scale_transition.dart';
import 'app/routes/app_pages.dart';
import 'app/services/local_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded<Future<void>>(
    () async {
      final database = HiveDatabase();
      await init(database);
      runApp(
        GetX<HiveDatabase>(
          builder: (_) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Class Link",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: FlexThemeData.light(
              blendLevel: 40,
              subThemesData: const FlexSubThemesData(blendTextTheme: false),
              colors: database.appTheme.value.light,
              useSubThemes: true,
              appBarStyle: database.appbarStyle.value,
            ),
            darkTheme: FlexThemeData.dark(
              blendLevel: 40,
              subThemesData: const FlexSubThemesData(blendTextTheme: false),
              darkIsTrueBlack: database.isBlack.value,
              colors: database.appTheme.value.dark,
              appBarStyle: database.appbarStyle.value,
              useSubThemes: true,
            ),
            themeMode: ThemeMode.system,
            customTransition: SharedAxisScaleTransition(),
          ),
        ),
      );
    },
    (error, stackTrace) =>
        {debugPrint("Error# $error "), debugPrint("StackTrace# $stackTrace")},
  );
}

Future<void> init(HiveDatabase database) async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Get.put<HiveDatabase>(database);
  await database.initDatabase();
  Get.put(FirestoreService());
  Get.put(AuthService());
}
