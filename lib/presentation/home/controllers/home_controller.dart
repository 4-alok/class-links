import 'dart:async';

import 'package:class_link/services/gsheet/repository/gsheet_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/utils/app_update.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../global/const/const.dart';
import '../../../global/models/time_table/time_table.dart';
import '../../../global/utils/patch.dart';
import '../../../services/firebase/models/my_elective_list.dart';
import '../../../services/gsheet/datasources/sheet_timetable_datasources.dart';
import '../../../services/hive/models/user_info.dart';
import '../../subject_info/controllers/subject_info_controller.dart';

const String session = "session";

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  final PageController pageController = PageController();

  final isLoading = false.obs;
  final resourcesPage = false.obs;

  // copy of originalList
  final week = Rx<List<Day>>([]);
  //  original list
  List<Day> originalList =
      List.generate(7, (index) => Day(day: Days.days[index], subjects: []));

  /// value changes every hour, to rebuild [TimeTablePage] body
  final hourlyUpdate = ValueNotifier(DateTime.now().hour);

  StreamSubscription? _hourlyUpdateSubscription;
  StreamSubscription<List<Day>>? _timeTableSubscription;

  SheetTimetableDatasources get timetableDatasource =>
      Get.find<GSheetService>().sheetTimetableDatasources;

  /// > We create a TabController, a StreamSubscription, and set the defaultDays variable
  @override
  void onInit() async {
    tabController =
        TabController(initialIndex: initialTab, vsync: this, length: 7);

    /// A stream that listens to the current hour and updates the `hourlyUpdate` value notifier.
    _hourlyUpdateSubscription =
        Stream.periodic(const Duration(seconds: 1), (i) => i).listen((_) =>
            hourlyUpdate.value != DateTime.now().hour
                ? hourlyUpdate.value = DateTime.now().hour
                : null);

    defaultDays;
    super.onInit();
  }

  /// A getter that returns a list of 7 days with empty subjects.
  void get defaultDays => week.value = List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );

  /// Returning the current day of the week.
  int get initialTab =>
      (DateTime.now().weekday == 7 || DateTime.now().weekday == 6)
          ? 0
          : DateTime.now().weekday - 1;

  /// > It loads the timetable, adds the elective subjects and checks for app updates
  @override
  void onReady() {
    loadTimetable;
    addElectiveSubjects;
    AndroidAppUpdate.update;
    Patch().init();
    super.onReady();
  }

  /// Adding the elective subjects to the timetable.
  Future<void> get addElectiveSubjects async {
    final List<MyElectiveSubjects> myElectiveTable =
        await Get.find<FirestoreService>()
            .electiveDatasources
            .getElectiveTimeTable;

    // for (final element in myElectiveTable) {
    //   switch (element.day) {
    //     case "Monday":
    //       week.value[0].subjects.addAll(element.subjects);
    //       break;
    //     case "Tuesday":
    //       week.value[1].subjects.addAll(element.subjects);
    //       break;
    //     case "Wednesday":
    //       week.value[2].subjects.addAll(element.subjects);
    //       break;
    //     case "Thursday":
    //       week.value[3].subjects.addAll(element.subjects);
    //       break;
    //     case "Friday":
    //       week.value[4].subjects.addAll(element.subjects);
    //       break;
    //   }
    // }
    // week.update((_) {});
  }

  /// Loading the timetable from the cache and then from the server.
  Future<void> get loadTimetable async {
    final timetableCache = await timetableDatasource.getMyTimetableCache;

    // if the cache is present then it will load the timetable from the cache
    // else it will load the timetable from the server
    if (timetableCache != null) {
      week.value = List.generate(
          timetableCache.week.length, (index) => timetableCache.week[index]);
      originalList = deepCopyWeek(timetableCache.week);
    } else {
      final timetable = await timetableDatasource.getMyTimetable;
      week.value = List.generate(
          timetable.week.length, (index) => timetable.week[index]);
      originalList = deepCopyWeek(timetable.week);
      await addElectiveSubjects;
    }

    // getting the cache date and time
    final cacheDateTime = await timetableDatasource.getMyTimetableCacheDate;

    // if the cache is older than 2 hour then it will update the cache from the server
    if (cacheDateTime != null) {
      if (!cacheDateTime
          .isAfter(DateTime.now().subtract(const Duration(hours: 2)))) {
        // cache is older than 2 hours
        final timetable = await timetableDatasource.getMyTimetable;
        week.value = List.generate(
            timetable.week.length, (index) => timetable.week[index]);
        originalList = deepCopyWeek(timetable.week);
        await addElectiveSubjects;
      }
    }
  }

  /// It creates a deep copy of a list of Day objects.
  ///
  /// Args:
  ///   originList (List<Day>): The list of days you want to copy.
  List<Day> deepCopyWeek(List<Day> originList) =>
      originList.map((e) => Day.fromJson(e.toJson())).toList();

  /// Getting the user info from the cache and if it is not present then it is getting it from the server.
  Future<UserInfo?> get getUserInfo async {
    final result = Get.find<HiveDatabase>().userBoxDatasources.userInfo;
    if (result != null) {
      return result;
    } else {
      final result2 =
          await Get.find<FirestoreService>().userInfoDatasources.getUserInfo;
      if (result2 != null) {
        await Get.find<HiveDatabase>().userBoxDatasources.setUserInfo(result2);
        return result2;
      } else {
        Get.offAllNamed(Routes.USER_BATCH);
      }
    }
    return null;
  }

  /// It cancels all subscriptions, disposes all streams, and deletes the SubjectInfoController
  @override
  void onClose() {
    if (_timeTableSubscription != null) _timeTableSubscription!.cancel();
    if (_hourlyUpdateSubscription != null) _hourlyUpdateSubscription!.cancel();
    hourlyUpdate.dispose();
    week.close();
    pageController.dispose();
    Get.delete<SubjectInfoController>(tag: SubjectInfoController.TAG);
    super.onClose();
  }
}
