import 'package:class_link/app/global/const/const.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:class_link/app/services/local_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late final TabController tabController;
  final week = Rx<List<Day>>([]);
  final editMode = false.obs;
  UserInfo? userInfo;

  @override
  void onInit() async {
    _defaultDays();
    tabController = TabController(vsync: this, length: 7);
    await getUserInfo();
    super.onInit();
  }

  void _defaultDays() => week.value = List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );

  Future<UserInfo?> getUserInfo() async {
    final result = await Get.find<HiveDatabase>().getUserInfo();
    if (result != null) {
      userInfo = result;
      return result;
    } else {
      final result2 = await Get.find<FirestoreService>().getUserInfo();
      if (result2 != null) {
        await Get.find<HiveDatabase>().setUserInfo(result2);
        userInfo = result2;
        return result2;
      } else {
        Get.offNamed(Routes.USER_INFO);
      }
    }
    return null;
  }

  void addSubject(Day day, Subject _subject) {
    week.update((val) =>
        week.value.firstWhere((e) => e.day == day.day).subjects.add(_subject));
  }

  void removeSubject(Subject subject, String day) => week.update((val) =>
      week.value.firstWhere((e) => e.day == day).subjects.remove(subject));

  void toggleEditMode() => editMode.value = !editMode.value;

  Future<void> signout() async {
    final _authService = Get.find<AuthService>();
    await _authService.logout();
    Get.offAllNamed(Routes.AUTH);
  }
}
