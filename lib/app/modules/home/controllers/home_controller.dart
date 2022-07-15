import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/time_table/time_table.dart';
import '../../../models/user_info/user_info.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/auth/patch.dart';
import '../../../services/firebase/firestore_service.dart';
import '../../../services/hive/hive_database.dart';
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

  @override
  void onInit() async {
    tabController = TabController(
      initialIndex: DateTime.now().weekday - 1,
      vsync: this,
      length: 7,
    );
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

  @override
  void onReady() {
    personalTimeTable ? initSubscription() : null;
    firstYearPreviousUserPatchMixin;
    AndroidAppUpdate();
    super.onReady();
  }

  Future<void> get _getUserRole async {
    if (personalTimeTable) {
      hideEdit.value = false;
    } else {
      final result2 = await Get.find<FirestoreService>().getUserInfo;
      if (result2 != null) {
        if (result2.role != "viewer") {
          hideEdit.value = false;
        }
      }
    }
  }

  void initSubscription() {
    final firestoreService = Get.find<FirestoreService>();
    if (personalTimeTable) {
      _timeTableSubscription =
          firestoreService.personalTimeTableStream.listen((event) {
        week.value = List.generate(event.length, (index) => event[index]);
        originalList = deepCopyWeek(event);
      });
    } else {
      _timeTableSubscription =
          firestoreService.batchTimeTableStream.listen((event) {
        week.value = List.generate(event.length, (index) => event[index]);
        originalList = deepCopyWeek(event);
      });
    }
  }

  Future<UserInfo?> get getUserInfo async {
    final result = Get.find<HiveDatabase>().userInfo;
    if (result != null) {
      initSubscription();
      return result;
    } else {
      final result2 = await Get.find<FirestoreService>().getUserInfo;
      if (result2 != null) {
        await Get.find<HiveDatabase>().setUserInfo(result2);
        initSubscription();
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
          .addOrUpdatePersonalTimeTable(timeTable);
    } else {
      final userInfo = Get.find<HiveDatabase>().userInfo!;
      final timeTable = TimeTable(
        week: week.value,
        creatorId: userInfo.id,
        batch: userInfo.batch,
        year: userInfo.year,
        slot: userInfo.slot,
        date: DateTime.now(),
      );
      await Get.find<FirestoreService>().addOrUpdateBatchTimeTable(timeTable);
    }
  }

  @override
  void onClose() {
    if (_timeTableSubscription != null) _timeTableSubscription!.cancel();
    if (_hourlyUpdateSubscription != null) _hourlyUpdateSubscription!.cancel();
    hourlyUpdate.dispose();
    week.close();
    Get.delete<SubjectInfoController>(tag: SubjectInfoController.TAG);
    super.onClose();
  }
}
