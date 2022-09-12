import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'services/analytics/analytics_service.dart';
import 'services/auth/repository/auth_service_repo.dart';
import 'services/firebase/repository/firestore_service.dart';
import 'services/gsheet/repository/gsheet_service.dart';
import 'services/hive/repository/hive_database.dart';
import 'services/notification/notification_service.dart';

Future<void> get init async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();

  MobileAds.instance.initialize();
  await Hive.initFlutter();

  final database = HiveDatabase();
  Get.put<HiveDatabase>(database);
  await database.initDatabase;
  Get.put(FirestoreService());
  Get.put(AuthService());
  final notificationService = NotificationService();
  Get.lazyPut<NotificationService>(() => notificationService);
  Get.lazyPut<AnalysisService>(() => AnalysisService());
  Get.lazyPut<GSheetService>(() => GSheetService());
}
