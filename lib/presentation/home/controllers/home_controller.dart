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
import '../../../services/auth/repository/auth_service_repo.dart';
import '../../../services/firebase/models/my_elective_list.dart';
import '../../../services/gsheet/datasources/sheet_timetable_datasources.dart';
import '../../../services/hive/models/user_info.dart';
import '../../subject_info/controllers/subject_info_controller.dart';
// import 'crud_operation.dart';

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
  List<Day> originalList = List.generate(
    7,
    (index) => Day(day: Days.days[index], subjects: []),
  );

  /// value changes every hour, to rebuild [TimeTablePage] body
  final hourlyUpdate = ValueNotifier(DateTime.now().hour);

  StreamSubscription? _hourlyUpdateSubscription;
  StreamSubscription<List<Day>>? _timeTableSubscription;

  SheetTimetableDatasources get timetableDatasource =>
      Get.find<GSheetService>().sheetTimetableDatasources;

  @override
  void onInit() async {
    tabController =
        TabController(initialIndex: initialTab, vsync: this, length: 7);

    _hourlyUpdateSubscription =
        Stream.periodic(const Duration(seconds: 1), (i) => i).listen((_) =>
            hourlyUpdate.value != DateTime.now().hour
                ? hourlyUpdate.value = DateTime.now().hour
                : null);

    defaultDays;
    super.onInit();
  }

  void get defaultDays => week.value = List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );

  int get initialTab =>
      (DateTime.now().weekday == 7 || DateTime.now().weekday == 6)
          ? 0
          : DateTime.now().weekday - 1;

  @override
  void onReady() {
    loadTimetable;
    addElectiveSubjects;
    AndroidAppUpdate().update;
    super.onReady();
  }

  Future<void> get addElectiveSubjects async {
    final List<MyElectiveSubjects> myElectiveTable =
        await Get.find<FirestoreService>()
            .electiveDatasources
            .getElectiveTimeTable;

    for (final element in myElectiveTable) {
      switch (element.day) {
        case "Monday":
          week.value[0].subjects.addAll(element.subjects);
          break;
        case "Tuesday":
          week.value[1].subjects.addAll(element.subjects);
          break;
        case "Wednesday":
          week.value[2].subjects.addAll(element.subjects);
          break;
        case "Thursday":
          week.value[3].subjects.addAll(element.subjects);
          break;
        case "Friday":
          week.value[4].subjects.addAll(element.subjects);
          break;
      }
    }
    week.update((_) {});
  }

  Future<void> get loadTimetable async {
    final timetableCache = await timetableDatasource.getMyTimetableCache;
    if (timetableCache != null) {
      week.value = List.generate(
          timetableCache.week.length, (index) => timetableCache.week[index]);
      originalList = deepCopyWeek(timetableCache.week);
    }
    final timetable = await timetableDatasource.getMyTimetable;
    week.value =
        List.generate(timetable.week.length, (index) => timetable.week[index]);
    originalList = deepCopyWeek(timetable.week);
    await addElectiveSubjects;
  }

  List<Day> deepCopyWeek(List<Day> originList) =>
      originList.map((e) => Day.fromJson(e.toJson())).toList();

  Future<UserInfo?> get getUserInfo async {
    final result = Get.find<HiveDatabase>().userBoxDatasources.userInfo;

    if (result != null) {
      if (await newSession()) return null;
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

  Future<bool> newSession() async {
    final hiveDatabase = Get.find<HiveDatabase>();
    final res = await hiveDatabase.cacheBoxDataSources.getRequest(session);
    if (res == null) {
      final authService = Get.find<AuthService>();
      await authService.logout;
      await Get.find<HiveDatabase>().userBoxDatasources.clearUserInfo;
      await hiveDatabase.cacheBoxDataSources
          .saveRequest(session, {'session': "2023-6-sem"});
      Get.offAllNamed(Routes.AUTH);
      return true;
    } else {
      return false;
    }
  }

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
