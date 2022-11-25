import 'dart:async';

import 'package:class_link/services/gsheet/repository/gsheet_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/utils/app_update.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth/utils/patch.dart';
import '../../../../services/firebase/models/elective_timetable.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../global/const/const.dart';
import '../../../global/models/time_table/time_table.dart';
import '../../../services/gsheet/datasources/sheet_timetable_datasources.dart';
import '../../../services/hive/models/user_info.dart';
import '../../subject_info/controllers/subject_info_controller.dart';
// import 'crud_operation.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin, UserPatchMixin {
  late final TabController tabController;

  final isLoading = false.obs;

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

  final electiveSubjects = ValueNotifier<List<ElectiveTimetable>>([]);

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
    // _getUserRole;
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
    // personalTimeTable ? initSubscription : null;
    loadTimetable;
    getElectiveSubjects;
    AndroidAppUpdate().update;
    thirdYearEmailPatch;
    super.onReady();
  }

  Future<void> get getElectiveSubjects async {
    electiveSubjects.value = await Get.find<FirestoreService>()
        .electiveDatasources
        .getUserElectiveSubjects(local: true);
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
  }

  List<Day> deepCopyWeek(List<Day> originList) =>
      originList.map((e) => Day.fromJson(e.toJson())).toList();

  Future<UserInfo?> get getUserInfo async {
    final result = Get.find<HiveDatabase>().userBoxDatasources.userInfo;
    if (result != null) {
      // initSubscription;
      return result;
    } else {
      final result2 =
          await Get.find<FirestoreService>().userInfoDatasources.getUserInfo;
      if (result2 != null) {
        await Get.find<HiveDatabase>().userBoxDatasources.setUserInfo(result2);
        // initSubscription;
        return result2;
      } else {
        Get.offAllNamed(Routes.USER_BATCH);
      }
    }
    return null;
  }

  @override
  void onClose() {
    if (_timeTableSubscription != null) _timeTableSubscription!.cancel();
    if (_hourlyUpdateSubscription != null) _hourlyUpdateSubscription!.cancel();
    hourlyUpdate.dispose();
    week.close();
    electiveSubjects.dispose();
    Get.delete<SubjectInfoController>(tag: SubjectInfoController.TAG);
    super.onClose();
  }
}
