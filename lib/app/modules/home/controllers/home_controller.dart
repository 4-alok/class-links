import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/time_table/time_table.dart';
import '../../../models/user_info/user_info.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/auth/patch.dart';
import '../../../services/firebase/models/elective_timetable.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/hive/repository/hive_database.dart';
import '../../../services/log/log_service.dart';
import '../../../utils/app_update.dart';
import '../../subject_info/controllers/subject_info_controller.dart';
import 'crud_operation.dart';

class HomeController extends GetxController
    with
        GetSingleTickerProviderStateMixin,
        TimeTableCrudOperationMixin,
        FirstYearPreviousUserPatchMixin {
  late final TabController tabController;
  late final bool personalTimeTable;
  final hideEdit = true.obs;
  final editMode = false.obs;
  final isLoading = false.obs;
  final isPostPage = false.obs;

  /// value changes every hour, to rebuild [TimeTablePage] body
  final hourlyUpdate = ValueNotifier(DateTime.now().hour);

  StreamSubscription? _hourlyUpdateSubscription;
  StreamSubscription<List<Day>>? _timeTableSubscription;

  final electiveSubjects = ValueNotifier<List<ElectiveTimetable>>([]);

  @override
  void onInit() async {
    tabController =
        TabController(initialIndex: initialTab, vsync: this, length: 7);
    personalTimeTable =
        (Get.find<AuthService>().userType() != UserType.user) ? true : false;

    _hourlyUpdateSubscription =
        Stream.periodic(const Duration(seconds: 1), (i) => i).listen((_) =>
            hourlyUpdate.value != DateTime.now().hour
                ? hourlyUpdate.value = DateTime.now().hour
                : null);

    defaultDays;
    _getUserRole;
    super.onInit();
  }

  int get initialTab =>
      (DateTime.now().weekday == 7 || DateTime.now().weekday == 6)
          ? 0
          : DateTime.now().weekday - 1;

  @override
  void onReady() {
    personalTimeTable ? initSubscription : null;
    getElectiveSubjects;
    firstYearPreviousUserPatchMixin;
    AndroidAppUpdate().update;
    super.onReady();
  }

  Future<void> get getElectiveSubjects async {
    electiveSubjects.value = await Get.find<FirestoreService>()
        .electiveDatasources
        .getUserElectiveSubjects(local: true);
  }

  Future<void> get _getUserRole async {
    if (personalTimeTable) {
      hideEdit.value = false;
    } else {
      if ((await Get.find<FirestoreService>().userInfoDatasources.getUserInfo)
              ?.role !=
          "viewer") hideEdit.value = false;
    }
  }

  Future<void> get initSubscription async {
    final firestoreService = Get.find<FirestoreService>();
    if (personalTimeTable) {
      _timeTableSubscription = firestoreService
          .timetableDatasource.personalTimeTableStream
          .listen((event) {
        week.value = List.generate(event.length, (index) => event[index]);
        originalList = deepCopyWeek(event);
      });
    } else {
      final timetable =
          await firestoreService.timetableDatasource.batchTimeTable;
      week.value = List.generate(timetable.length, (index) => timetable[index]);
      originalList = deepCopyWeek(timetable);
    }
  }

  Future<UserInfo?> get getUserInfo async {
    final result = Get.find<HiveDatabase>().userBox.userInfo;
    if (result != null) {
      initSubscription;
      return result;
    } else {
      final result2 =
          await Get.find<FirestoreService>().userInfoDatasources.getUserInfo;
      if (result2 != null) {
        await Get.find<HiveDatabase>().userBox.setUserInfo(result2);
        initSubscription;
        return result2;
      } else {
        Get.offAllNamed(Routes.USER_BATCH);
      }
    }
    return null;
  }

  void cancelEditMode() {
    logData = [];
    week.value = deepCopyWeek(originalList);
    editMode.value = false;
  }

  Future<String?> get toggleEditMode async {
    if (editMode.value) {
      final isValidate = validate;
      if (isValidate == null) {
        isLoading.value = true;
        if (personalTimeTable) {
          await _addOrUpdateTimeTable;
          logData.clear();
          editMode.value = false;
        } else if (await Get.find<GoogleSheetService>().addEntry(logData) ??
            false) {
          await _addOrUpdateTimeTable;
          logData.clear();
          editMode.value = false;
        }
        isLoading.value = false;
      } else {
        return validate;
      }
    } else {
      editMode.value = true;
    }
    return null;
  }

  Future<void> get _addOrUpdateTimeTable async {
    if (personalTimeTable) {
      final email = Get.find<AuthService>().user!.email!;
      final timeTable = TimeTable(
        week: week.value,
        creatorId: email,
        batch: '',
        date: DateTime.now(),
        slot: -1,
        year: -1,
      );
      await Get.find<FirestoreService>()
          .timetableDatasource
          .addOrUpdatePersonalTimeTable(timeTable);
    } else {
      final userInfo = Get.find<HiveDatabase>().userBox.userInfo!;
      final timeTable = TimeTable(
        week: week.value,
        creatorId: userInfo.id,
        batch: userInfo.batch,
        year: userInfo.year,
        slot: userInfo.slot,
        date: DateTime.now(),
      );
      await Get.find<FirestoreService>()
          .timetableDatasource
          .addOrUpdateBatchTimeTable(timeTable);
    }
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
