import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/local_database.dart';

void main() async {
  await init();
  runApp(
    Builder(
      builder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        // theme: ThemeClass.buildTheme(context),
      ),
    ),
  );
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Get.put(AuthService());
  Get.put(FirestoreService());
  final database = HiveDatabase();
  Get.lazyPut<HiveDatabase>(() => database);
  await database.initDatabase();
}
