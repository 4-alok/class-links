import 'dart:async';

import 'package:class_link/global/utils/get_snackbar.dart';
import 'package:class_link/presentation/app_users/controller/search_controller.dart';
import 'package:class_link/services/firebase/repository/firestore_service.dart';
import 'package:class_link/services/gsheet/repository/gsheet_service.dart';
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
  final Rx<int?> selectedYear = Rx<int?>(null);
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
    selectedYear.listen((_) => update());
    userSortType.listen((_) => update());
    selectedBatch.listen((_) => update());
    super.onReady();
  }

  Future<void> deleteUser(UserInfo userInfo) async => firestoreService
      .userInfoDatasources
      .deleteUser(userInfo)
      .then((value) => Message("Deleted", "User Deleted Successfully"))
      .onError(
          (error, stackTrace) => Message("Error", "Error while deleting user"));

  Future<void> get syncGSheetUsers async {
    final gsheetUserList = await Get.find<GSheetService>()
        .gSheetUserInfoDatasources
        .getAllUserList
        .onError((error, stackTrace) {
      Message("Error", error.toString());
      return [];
    });

    List<UserInfo> listToAddInGsheet = [];
    for (UserInfo userInfo in allUsersList) {
      if (gsheetUserList
          .where((element) => element.id == userInfo.id)
          .isEmpty) {
        listToAddInGsheet.add(userInfo);
      }
    }

    await Get.find<GSheetService>()
        .gSheetUserInfoDatasources
        .addUsersList(listToAddInGsheet);

    Message("Synced Successfully", "Added ${listToAddInGsheet.length} users");
  }

  Future<void> get _getUsers async {
    allUsersList = await Get.find<GSheetService>()
        .gSheetUserInfoDatasources
        .getAllUserList
        .onError((error, stackTrace) {
      Message("Error", error.toString());
      return [];
    });
    _updateYearWiseUserCount;
    loading.value = false;
    update();
  }

  // void _subscriptionUpdate(List<UserInfo> users) {
  //   allUsersList = users;
  //   _updateYearWiseUserCount;
  //   loading.value == true ? loading.value = false : null;
  //   update();
  // }

  void get _updateYearWiseUserCount => yearWiseUserCount.value = [
        allUsersList.where((element) => element.year == 1).length,
        allUsersList.where((element) => element.year == 2).length,
        allUsersList.where((element) => element.year == 3).length
      ];

  List<UserInfo> get getUserList {
    _filteredUsersList = allUsersList
        .where((element) => selectedYear.value == null
            ? true
            : element.year == selectedYear.value)
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
      _filteredUsersList.sort((a, b) => b.date.compareTo(a.date));
    }
    // print(_filteredUsersList.length);
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
          (element) => element.year == user.year && element.batch == user.batch,
          orElse: () => BatchInfo(user.year, user.batch, 0));
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
      if (selectedYear.value == null) {
        return 'All Years (${getUserList.length})';
      } else {
        return 'Year ${selectedYear.value} (${getUserList.length})';
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
