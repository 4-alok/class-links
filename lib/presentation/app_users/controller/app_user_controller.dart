import 'dart:async';

import 'search_controller.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/gsheet/repository/gsheet_service.dart';
import '../../../services/hive/repository/hive_database.dart';
import '../../../services/hive/utils/cache_key.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../services/hive/models/user_info.dart';

enum UserSortType { userId, id, date }

const List<String> filterOptions = ['ID', 'Date', 'User ID'];

class BatchInfo {
  final int year;
  final String batch;
  final int count;

  const BatchInfo(this.year, this.batch, this.count);
}

class AppUsersController extends GetxController {
  final RxList<int> yearWiseUserCount = RxList<int>([0, 0, 0]);
  final Rx<UserSortType> userSortType = Rx<UserSortType>(UserSortType.date);
  final Rx<int?> selectedSemester = Rx<int?>(null);
  final Rx<String?> selectedBatch = Rx<String?>(null);
  final firestoreService = Get.find<FirestoreService>();
  List<UserInfo> allUsersList = [];
  List<UserInfo> _filteredUsersList = [];
  final loading = true.obs;

  final ScrollController scrollController = ScrollController();

  late final UsersSearchController searchController;

  @override
  void onInit() {
    searchController = UsersSearchController(this);
    super.onInit();
  }

  @override
  void onReady() {
    _getUsers;
    selectedSemester.listen((_) => update());
    userSortType.listen((_) => update());
    selectedBatch.listen((_) => update());
    super.onReady();
  }

  // Future<void> deleteUser(UserInfo userInfo) async => firestoreService
  //     .userInfoDatasources
  //     .deleteUser(userInfo)
  //     .then((value) => Message("Deleted", "User Deleted Successfully"))
  //     .onError(
  //         (error, stackTrace) => Message("Error", "Error while deleting user"));

  // Future<void> get syncGSheetUsers async {
  //   final gsheetUserList = await Get.find<GSheetService>()
  //       .gSheetUserInfoDatasources
  //       .getAllUserList
  //       .onError((error, stackTrace) {
  //     Message("Error", error.toString());
  //     return [];
  //   });

  //   List<UserInfo> listToAddInGsheet = [];
  //   for (UserInfo userInfo in allUsersList) {
  //     if (gsheetUserList
  //         .where((element) => element.id == userInfo.id)
  //         .isEmpty) {
  //       listToAddInGsheet.add(userInfo);
  //     }
  //   }

  //   await Get.find<GSheetService>()
  //       .gSheetUserInfoDatasources
  //       .addUsersList(listToAddInGsheet);

  //   Message("Synced Successfully", "Added ${listToAddInGsheet.length} users");
  // }

  Future<UserInfoList> _getAllUserList() async => UserInfoList(
        list: await Get.find<GSheetService>()
            .gSheetUserInfoDatasources
            .getAllUserList(),
      );

  Future<void> get _getUsers async {
    allUsersList =
        (await Get.find<HiveDatabase>().getFromCacheOrFetch<UserInfoList>(
              checkExpired: true,
              duration: const Duration(hours: 1),
              key: CacheKey.ALL_USER_LIST,
              fetchData: _getAllUserList,
            ))
                ?.list ??
            [];

    _updateSemesterWiseUserCount;
    loading.value = false;
    update();
  }

  // void _subscriptionUpdate(List<UserInfo> users) {
  //   allUsersList = users;
  //   _updateYearWiseUserCount;
  //   loading.value == true ? loading.value = false : null;
  //   update();
  // }

  void get _updateSemesterWiseUserCount => yearWiseUserCount.value = [
        ...List.generate(
          6,
          (index) =>
              allUsersList.where((element) => element.semester == index).length,
          growable: false,
        ),
      ];

  List<UserInfo> get getUserList {
    _filteredUsersList = allUsersList
        .where((element) => selectedSemester.value == null
            ? true
            : element.semester == selectedSemester.value)
        .toList();

    if (selectedBatch.value != null) {
      _filteredUsersList = _filteredUsersList
          .where((element) => element.batch == selectedBatch.value)
          .toList();
    }

    if (userSortType.value == UserSortType.userId) {
      _filteredUsersList.sort((a, b) => a.userName.compareTo(b.userName));
    } else if (userSortType.value == UserSortType.id) {
      _filteredUsersList.sort((a, b) => a.id.compareTo(b.id));
    } else if (userSortType.value == UserSortType.date) {
      _filteredUsersList.sort((a, b) => b.joiningDate.compareTo(a.joiningDate));
    }
    return _filteredUsersList;
  }

  void updateFilter(String filter) {
    switch (filter) {
      case 'ID':
        userSortType.value = UserSortType.id;
        break;
      case 'Date':
        userSortType.value = UserSortType.date;
        break;
      case 'User ID':
        userSortType.value = UserSortType.userId;
        break;
    }
    Get.back();
  }

  List<BatchInfo> batchList(List<UserInfo> users) {
    List<BatchInfo> batches = [];
    // iterate over all users
    for (final user in users) {
      // check if batch is already present in list
      final batchInfo = batches.firstWhere(
          (element) =>
              element.year == user.semester && element.batch == user.batch,
          orElse: () => BatchInfo(user.semester, user.batch, 0));
      // if batch is not present then add it to list
      batches.remove(batchInfo);
      batches
          .add(BatchInfo(batchInfo.year, batchInfo.batch, batchInfo.count + 1));
    }
    batches.sort((b, a) => a.batch.compareTo(b.batch));
    return batches;
  }

  String get bottomBarText {
    if (selectedBatch.value == null) {
      if (selectedSemester.value == null) {
        return 'All Years (${getUserList.length})';
      } else {
        return 'Year ${selectedSemester.value} (${getUserList.length})';
      }
    } else {
      return '${selectedBatch.value ?? "All Batches"} (${getUserList.length})';
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
