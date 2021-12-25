import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'app/global/theme/theme.dart';
import 'app/global/transition_animation.dart/shared_axis_scale_transition.dart';
import 'app/routes/app_pages.dart';
import 'app/services/local_database.dart';

void main() async {
  await init();
  runApp(Builder(
    builder: (context) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Class Link",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeClass.redLightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.light,

      customTransition: SharedAxisScaleTransition(),
    ),
  ));
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  await Hive.initFlutter();
  final database = HiveDatabase();
  Get.put<HiveDatabase>(database);
  await database.initDatabase();
  Get.put(FirestoreService());
  Get.put(AuthService());
}
