import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/services/auth_service.dart';
import 'app/services/firestore_service.dart';
import 'app/services/hive_database.dart';
import 'app/services/log_service.dart';
import 'app/services/notification_service.dart';

Future<void> init() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  await Hive.initFlutter();
  final database = HiveDatabase();
  Get.put<HiveDatabase>(database);
  await database.initDatabase();
  Get.put(FirestoreService());
  Get.put(AuthService());
  Get.lazyPut(() => NotificationService());
  Get.lazyPut(() => GoogleSheetService());
}
