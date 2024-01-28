import 'package:class_link/services/gsheet/models/my_teacher_adapter.dart';
import 'package:class_link/services/hive/models/adapter/user_info_adapter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'global/models/sheet_data/sheet_data_adapter.dart';
import 'global/models/time_table/time_table_adapter.dart';
import 'global/models/time_table/timetables.dart';
import 'services/analytics/analytics_service.dart';
import 'services/auth/repository/auth_service_repo.dart';
import 'services/firebase/models/user_elecetive_section_adapter.dart';
import 'services/firebase/repository/firestore_service.dart';
import 'services/gsheet/repository/gsheet_service.dart';
import 'services/hive/repository/hive_database.dart';
// import 'services/notification/notification_service.dart';

/// Initializing the app.
Future<void> get init async {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     systemNavigationBarColor: Colors.transparent));
  await Firebase.initializeApp();
  // await NotificationService.initializeLocalNotifications();
  await Hive.initFlutter();

  // Hive.registerAdapter(TimeWrapedAdapter()); // TypeId = 10
  Hive.registerAdapter(UserInfoAdapter()); // TypeId = 11
  Hive.registerAdapter(UserInfoListAdapter()); // TypeId = 14
  Hive.registerAdapter(SheetDataAdapter()); // TypeId = 13
  Hive.registerAdapter(TeacherAdapter()); // TypeId = 21
  Hive.registerAdapter(MyTeacherAdapter()); // TypeId = 22
  Hive.registerAdapter(UserElectiveSectionAdapter()); // TypeId = 31

  // Timetable:
  Hive.registerAdapter(DayTimeAdapter()); // TypeId = 40
  Hive.registerAdapter(SubjectAdapter()); // TypeId = 41
  Hive.registerAdapter(DayAdapter()); // TypeId = 42
  Hive.registerAdapter(TimetableAdapter()); // TypeId = 43
  Hive.registerAdapter(TimetablesAdapter()); // TypeId = 44

  final database = HiveDatabase();
  Get.put<HiveDatabase>(database);
  await database.initDatabase;
  Get.put(FirestoreService());
  Get.put(AuthService());
  Get.lazyPut<AnalysisService>(() => AnalysisService());
  Get.lazyPut<GSheetService>(() => GSheetService());
}
