import 'package:class_link/global/utils/get_snackbar.dart';
import 'package:class_link/services/hive/utils/cache_key.dart';
import 'package:get/get.dart';

import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/gsheet/repository/gsheet_service.dart';
import '../../../services/hive/models/user_info.dart';
import '../../../services/hive/repository/hive_database.dart';

class DatabaseUtilsController {
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  FirestoreService get firestoreService => Get.find<FirestoreService>();
  GSheetService get gSheetService => Get.find<GSheetService>();

  final userInfo = Rx<UserInfo?>(null);
  final timeTableText = Rx<String>("");

  void clearUserInfo() async => userInfo.value = null;

  void fetchUserInfo() async {
    userInfo.value = await firestoreService.userInfoDatasources.getUserInfo();
  }

  void fetchHUserInfo() async {
    final res = await hiveDatabase.cacheBoxDataSources
        .getCache<UserInfo>(CacheKey.USER_INFO);
    if (res != null) {
      userInfo.value = res;
    } else {
      Message("No Data", "No Data in Hive");
    }
  }

  Future saveUserInfo() async {
    await hiveDatabase.cacheBoxDataSources
        .saveCache<UserInfo>(userInfo.value!, CacheKey.USER_INFO);
  }

  Future clearCache() async {
    await hiveDatabase.cacheBoxDataSources
        .deleteCache<UserInfo>(CacheKey.USER_INFO);
    userInfo.value = null;
  }

  void ui() => userInfo.value = hiveDatabase.userBoxDatasources.userInfo.value;

  Future<void> updateUserInfoInCache() async {
    // get user info from cache
    final userInfo = await hiveDatabase.cacheBoxDataSources
        .getCache<UserInfo>(CacheKey.USER_INFO);

    if (userInfo != null) {
      await hiveDatabase.cacheBoxDataSources.saveCache<UserInfo>(
          userInfo.copyWith(batch: 'CSE-2'), CacheKey.USER_INFO);
    }
  }

  Future<void> streamTimetable() async {
    // hiveDatabase
    //     .streamCachedDataOrFetch<TimeTables>(
    //         key: CacheKey.TIME_TABLES,
    //         duration: const Duration(minutes: 5),
    //         fetchData: Get.find<GSheetService>()
    //             .sheetTimetableDatasources
    //             .getTimetableData)
    //     .listen((event) {
    //   if (event == null) {
    //     timeTableText.value = "No Data";
    //   } else {
    //     printTimetable(event.t)
    //   }
    // });
  }

  // void printTimetable(List<TimeTable> timetables) async {
  //   print("=============Printing Timetable=============");
  //   for (var t in timetables) {
  //     print(t.batch);
  //     for (var d in t.week) {
  //       print(d.day);
  //       print(d.subjects
  //           .map((e) => "${e.subjectName},${e.roomNo},${e.startTime.hour}||")
  //           .toList());
  //     }
  //     print("\n\n");
  //   }
  //   print("=============Printing Timetable=============");
  // }

  getIndex() async {
    // final userInfo = UserInfo(
    //   id: "21051370@kiit.ac.in",
    //   userName: "Rahul",
    //   semester: 6,
    //   stream: "CSE",
    //   batch: "CSE-2",
    //   electiveSections: [],
    //   role: "",
    //   joiningDate: DateTime.now(),
    // );
    // final index =
    //     await gSheetService.gSheetUserInfoDatasources.updateUserInfo(userInfo);
    // print(index);
  }

  Future<void> addUserInfo() async {
    await gSheetService.gSheetUserInfoDatasources.addUserInfo(
      UserInfo(
          id: "21051390@kiit.ac.in",
          userName: "Rahul",
          semester: 6,
          stream: "CSE",
          batch: "CSE-2",
          electiveSections: [],
          role: "user",
          joiningDate: DateTime.now()),
    );
  }

  Future getUserList() async {
    // final users = await gSheetService.gSheetUserInfoDatasources.getAllUserList;
    // print(users);
  }

  Future<void> cacheExpiryTime() async {
    // final time = await hiveDatabase.cacheBoxDataSources
    //     .getCacheTime<TimeTable>(CacheKey.TIME_TABLE);
    // debugPrint(time.toString());
  }

  Future<void> deleteTimetableFromCache() async {
    // await hiveDatabase.cacheBoxDataSources
    // .deleteCache<TimeTable>(CacheKey.TIME_TABLE);
  }

  void clearAllCache() async =>
      hiveDatabase.cacheBoxDataSources.clearAllCache();

  dispose() {
    userInfo.close();
    timeTableText.close();
  }
}
