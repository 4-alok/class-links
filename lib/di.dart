import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'services/analytics/analytics_service.dart';
import 'services/auth/repository/auth_service_repo.dart';
import 'services/firebase/repository/firestore_service.dart';
import 'services/gsheet/repository/gsheet_service.dart';
import 'services/hive/repository/hive_database.dart';
import 'services/notification/notification_service.dart';

/// Initializing the app.
Future<void> get init async {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     systemNavigationBarColor: Colors.transparent));
  await Firebase.initializeApp();
  await NotificationService.initializeLocalNotifications();
  await Hive.initFlutter();

  final database = HiveDatabase();
  Get.put<HiveDatabase>(database);
  await database.initDatabase;
  Get.put(FirestoreService());
  Get.put(AuthService());
  Get.lazyPut<AnalysisService>(() => AnalysisService());
  Get.lazyPut<GSheetService>(() => GSheetService());
}
