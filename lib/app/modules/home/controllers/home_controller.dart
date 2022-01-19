import 'dart:async';
import 'package:class_link/app/global/const/const.dart';
import 'package:class_link/app/models/log/log.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/modules/subject_info/controllers/subject_info_controller.dart';
import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:class_link/app/services/hive_database.dart';
import 'package:class_link/app/services/log_service.dart';
import 'package:class_link/app/utils/get_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;
  final week = Rx<List<Day>>([]);
  final hideEdit = true.obs;
  final editMode = false.obs;
  final isLoading = false.obs;
  StreamSubscription<List<Day>>? _timeTableSubscription;
  List<Day> originalList = List.generate(
    7,
    (index) => Day(day: Days.days[index], subjects: []),
  );
  List<LogData> logData = [];

  @override
  void onInit() async {
    tabController = TabController(
      initialIndex: DateTime.now().weekday - 1,
      vsync: this,
      length: 7,
    );
    _defaultDays();
    _getUserRole();
    super.onInit();
  }

  Future<void> _getUserRole() async {
    final result2 = await Get.find<FirestoreService>().getUserInfo();
    if (result2 != null) {
      if (result2.role != "viewer") {
        hideEdit.value = false;
      }
    }
  }

  void initSubscription() => _timeTableSubscription =
          Get.find<FirestoreService>().timeTableStream().listen((event) {
        week.value = List.generate(event.length, (index) => event[index]);
        originalList = _deepCopyWeek(event);
      });

  void _defaultDays() => week.value = List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );

  Future<UserInfo?> get getUserInfo async {
    final result = Get.find<HiveDatabase>().userInfo;
    if (result != null) {
      initSubscription();
      return result;
    } else {
      final result2 = await Get.find<FirestoreService>().getUserInfo();
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

  void cancleEditMode() {
    logData = [];
    week.value = _deepCopyWeek(originalList);
    editMode.value = false;
  }

  void addSubject(Day day, Subject _subject) {
    if (day.subjects
        .where((e) => e.startTime.hour == _subject.startTime.hour)
        .isEmpty) {
      week.update((val) => week.value
          .firstWhere((e) => e.day == day.day)
          .subjects
          .add(_subject));
      createLog("${_subject.subjectName} added to ${day.day}");
    } else {
      Message("Error", "Subject already exists at this time");
    }
  }

  void createLog(String changes) {
    final user = Get.find<AuthService>().user;
    logData.add(
      LogData(
          name: user?.displayName ?? "",
          email: user?.email ?? "",
          log: changes,
          date: DateTime.now()),
    );
  }

  void updateSubject(String day, Subject _oldSubject, Subject _newSubject) {
    final _day = week.value.firstWhere((e) => e.day == day);
    week.update((val) => _day.subjects[_day.subjects
        .indexWhere((element) => element == _oldSubject)] = _newSubject);

    if (_oldSubject.remark != _newSubject.remark) {
      createLog(
          "${_newSubject.subjectName} remark changed to '${_newSubject.remark}' for $day");
    } else {
      createLog("${_newSubject.subjectName} updated for $day");
    }
  }

  void removeSubject(Subject subject, String day) => week.update((val) {
        createLog("Removed ${subject.subjectName} from $day");
        week.value.firstWhere((e) => e.day == day).subjects.remove(subject);
      });

  void finishReorder(Subject _subject, int _from, int _to,
      List<Subject> _subjects, String day) {
    week.value.firstWhere((e) => e.day == day).subjects.clear();
    week.value.firstWhere((e) => e.day == day).subjects.addAll(_subjects);
  }

  Future<String?> toggleEditMode() async {
    if (editMode.value) {
      final _validate = this._validate;
      if (_validate == null) {
        isLoading.value = true;
        if (await Get.find<GoogleSheetSerevice>().addEntry(logData) ?? false) {
          await _addOrUpdateTimeTable;
          logData.clear();
          editMode.value = false;
        }
        isLoading.value = false;
      } else {
        return _validate;
      }
    } else {
      editMode.value = true;
    }
  }

  String? get _validate {
    // if (_isNotEqual) {
    //   return "No changes made";
    // }
    for (final day in week.value) {
      for (int i = 1; i < day.subjects.length; i++) {
        final beforeSubTime = day.subjects[i - 1].startTime;
        final startingTime = day.subjects[i].startTime;
        if (((startingTime.hour * 60) + startingTime.minute) <
            ((beforeSubTime.hour * 60) + beforeSubTime.minute)) {
          return "Error at ${day.subjects[i - 1].subjectName}\nArrange subjects in order";
        }
      }
    }
    return null;
  }

  bool? get _isNotEqual {
    // TODO: implement _isNotEqual
  }

  Future<void> get _addOrUpdateTimeTable async {
    final _userInfo = Get.find<HiveDatabase>().userInfo!;
    final timeTable = TimeTable(
      week: week.value,
      creatorId: _userInfo.id,
      batch: _userInfo.batch,
      year: _userInfo.year,
      slot: _userInfo.slot,
      date: DateTime.now(),
    );
    await Get.find<FirestoreService>().addOrUpdateTimeTable(timeTable);
  }

  List<Day> _deepCopyWeek(List<Day> originList) =>
      originList.map((e) => Day.fromJson(e.toJson())).toList();

  @override
  void onClose() {
    if (_timeTableSubscription != null) _timeTableSubscription!.cancel();
    Get.delete<SubjectInfoController>(tag: SubjectInfoController.TAG);
    super.onClose();
  }
}
