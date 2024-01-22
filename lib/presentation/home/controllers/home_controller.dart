import 'dart:async';

import 'package:class_link/services/analytics/analytics_service.dart';
import 'package:class_link/services/gsheet/repository/gsheet_service.dart';
import 'package:class_link/services/hive/utils/cache_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/utils/app_update.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../global/const/const.dart';
import '../../../global/models/time_table/time_table.dart';
import '../../../services/gsheet/datasources/sheet_timetable_datasources.dart';
import '../../../services/hive/models/user_info.dart';
import '../../subject_info/controllers/subject_info_controller.dart';
import 'utils/timetable_task.dart';

const String session = "session";

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  final PageController pageController = PageController();
  final timeTaskUtils = TimetableTaskUtils();

  final isLoading = false.obs;
  final resourcesPage = false.obs;

  // // copy of originalList
  final week = Rx<List<Day>>([]);
  // //  original list
  // List<Day> originalList =
  //     List.generate(7, (index) => Day(day: Days.days[index], subjects: []));

  /// value changes every hour, to rebuild [TimeTablePage] body
  final hourlyUpdate = ValueNotifier(DateTime.now().hour);

  StreamSubscription? _hourlyUpdateSubscription;
  StreamSubscription<List<Day>>? _timeTableSubscription;

  SheetTimetableDatasources get timetableDatasource =>
      Get.find<GSheetService>().sheetTimetableDatasources;

  // Dependency Injection: GetX ------------------------------
  FirestoreService get firestoreService => Get.find<FirestoreService>();
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  GSheetService get gSheetService => Get.find<GSheetService>();
  // ---------------------------------------------------------

  /// > We create a TabController, a StreamSubscription, and set the defaultDays variable
  @override
  void onInit() async {
    // Sets the default days to the week variable
    tabController =
        TabController(initialIndex: initialTab, vsync: this, length: 7);

    week.value = defaultDays;

    /// A stream that listens to the current hour and updates the `hourlyUpdate` value notifier.
    _hourlyUpdateSubscription =
        Stream.periodic(const Duration(seconds: 1), (i) => i).listen((_) =>
            hourlyUpdate.value != DateTime.now().hour
                ? hourlyUpdate.value = DateTime.now().hour
                : null);
    super.onInit();
  }

  // /// A getter that returns a list of 7 days with empty subjects.
  List<Day> get defaultDays => List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );

  /// Returning the current day of the week [0-6].
  int get initialTab =>
      (DateTime.now().weekday == 7 || DateTime.now().weekday == 6)
          ? 0
          : DateTime.now().weekday - 1;

  /// It loads the timetable, adds the elective subjects and checks for app updates
  @override
  void onReady() {
    fetchAndProcessTimetable();
    AndroidAppUpdate.update;
    // Patch().init;
    analyticsEvent();

    // Refreshing the timetable when the user section change changes
    refreshTimetable();
    
    super.onReady();
  }

  // Refreshing the timetable when the user section change changes
  void refreshTimetable() => hiveDatabase.userBoxDatasources.userInfo
        .listen((user) async => await fetchAndProcessTimetable());

  Future<void> fetchAndProcessTimetable() async {
    final timeTaskUtils = TimetableTaskUtils();
    hiveDatabase.streamCachedDataOrFetch<TimeTable>(
      key: CacheKey.TIME_TABLE,
      duration: const Duration(hours: 1),
      fetchData:
          Get.find<GSheetService>().sheetTimetableDatasources.getMyTimetable,
      preProcessTasks: [
        timeTaskUtils.addElectiveSubjects,
        timeTaskUtils.addTeacherNames,
      ],
    ).listen((event) => week.value = event != null
        ? List.generate(event.week.length, (index) => event.week[index])
        : defaultDays);
  }

  // create analytics event
  Future<void> analyticsEvent() async {
    final analysisEvent = Get.find<AnalysisService>();
    await analysisEvent.appOpened();
    await analysisEvent.themeUsageAnalysis();
  }

  /// Getting the user info from the cache and if it is not present then it is getting it from the server.
  Future<UserInfo?> get getUserInfo async =>
      await hiveDatabase.getFromCacheOrFetch<UserInfo>(
        key: CacheKey.USER_INFO,
        checkExpired: true,
        duration: const Duration(days: 1),
        // Need to change it to firebase
        fetchData: gSheetService.gSheetUserInfoDatasources.getUserInfo,
      );

  /// It cancels all subscriptions, disposes all streams, and deletes the SubjectInfoController
  @override
  void onClose() {
    if (_timeTableSubscription != null) _timeTableSubscription!.cancel();
    if (_hourlyUpdateSubscription != null) _hourlyUpdateSubscription!.cancel();
    hourlyUpdate.dispose();
    // week.close();
    pageController.dispose();
    Get.delete<SubjectInfoController>(tag: SubjectInfoController.TAG);
    super.onClose();
  }
}
