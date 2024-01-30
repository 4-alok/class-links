import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../global/const/const.dart';
import '../../../global/models/time_table/time_table.dart';
import '../../../global/models/time_table/timetables.dart';
import '../../../global/utils/app_update.dart';
import '../../../routes/app_pages.dart';
import '../../../services/analytics/analytics_service.dart';
import '../../../services/auth/repository/auth_service_repo.dart';
import '../../../services/gsheet/datasources/sheet_timetable_datasources.dart';
import '../../../services/gsheet/repository/gsheet_service.dart';
import '../../../services/hive/models/user_info.dart';
import '../../../services/hive/utils/cache_key.dart';
import '../../subject_info/controllers/subject_info_controller.dart';
import 'utils/timetable_task.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  final PageController pageController = PageController();
  final timeTaskUtils = TimetableTaskUtils();

  final RxBool isLoading = false.obs;
  final RxBool resourcesPage = false.obs;

  // // copy of originalList
  final week = Rx<List<Day>>([]);

  /// value changes every hour, to rebuild [TimeTablePage] body
  final hourlyUpdate = ValueNotifier(DateTime.now().hour);

  // Stream Subscription: ------------------------------------//
  StreamSubscription? _hourlyUpdateSubscription;
  StreamSubscription<List<Day>>? _timeTableSubscription;
  StreamSubscription<TimeTables?>? _timeTablesSubscription;
  StreamSubscription<UserInfo?>? _userInfoSubscription;
  // ---------------------------------------------------------//

  SheetTimetableDatasources get timetableDatasource =>
      Get.find<GSheetService>().sheetTimetableDatasources;

  // Dependency Injection: GetX ------------------------------//
  FirestoreService get firestoreService => Get.find<FirestoreService>();
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  GSheetService get gSheetService => Get.find<GSheetService>();
  // ---------------------------------------------------------//

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

  // A getter that returns a list of 7 days with empty subjects.
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
    analyticsEvent();

    // Refreshing the timetable when the user section change changes
    refreshTimetable();

    super.onReady();
  }

  // Refreshing the timetable when the user section change changes
  void refreshTimetable() =>
      _userInfoSubscription = hiveDatabase.userBoxDatasources.userInfo.listen(
        (user) async => await fetchAndProcessTimetable(),
      );

  /// It fetches the timetable from the server, processes it, and adds it to the [week] variable.
  Future<void> fetchAndProcessTimetable() async {
    // Canceling the previous subscription if it exists
    _timeTablesSubscription?.cancel();

    final timeTaskUtils = TimetableTaskUtils();

    _timeTablesSubscription = hiveDatabase
        .streamCachedDataOrFetch<TimeTables>(
      key: CacheKey.TIME_TABLES,
      duration: const Duration(hours: 1),
      fetchData: () async => await Get.find<GSheetService>()
          .sheetTimetableDatasources
          .getTimetableData,
    )
        .listen((event) async {
      if (event != null) {
        // filter to user section
        final filteredTimetable = await timeTaskUtils.filterToMySection(event);
        final withElectiveSection =
            await timeTaskUtils.addElectiveSubjects(filteredTimetable);
        final withTeacherName =
            await timeTaskUtils.addTeachersName(withElectiveSection);

        week.value = List.generate(
          withTeacherName.timeTables.first.week.length,
          (index) => withTeacherName.timeTables.first.week[index],
        );
      } else {
        week.value = defaultDays;
      }
    });
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

  // Logout the user, clear the caches and navigate to the AuthView
  Future<void> logout() async {
    await Get.find<AuthService>().logout;
    await Get.offAllNamed(Routes.AUTH);
  }

  /// It cancels all subscriptions, disposes all streams, and deletes the SubjectInfoController
  @override
  void onClose() {
    // canceling all subscriptions ----------------------------//
    if (_timeTableSubscription != null) _timeTableSubscription!.cancel();
    if (_hourlyUpdateSubscription != null) _hourlyUpdateSubscription!.cancel();
    if (_timeTablesSubscription != null) _timeTablesSubscription!.cancel();
    if (_userInfoSubscription != null) _userInfoSubscription!.cancel();
    // ---------------------------------------------------------//

    hourlyUpdate.dispose();
    week.close();
    pageController.dispose();
    Get.delete<SubjectInfoController>(tag: SubjectInfoController.TAG);
    super.onClose();
  }
}
