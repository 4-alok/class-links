import 'dart:async';
import 'dart:collection';

import 'package:class_link/services/firebase/repository/firestore_service.dart';
import 'package:get/get.dart';

import '../../../services/hive/models/user_info.dart';

enum UserSortType { userId, id, date }

const List<String> filterOptions = ['ID', 'Date', 'User ID'];

class AppUsersController extends GetxController {
  final RxList<int> yearWiseUserCount = RxList<int>([0, 0, 0]);
  final Rx<UserSortType> userSortType = Rx<UserSortType>(UserSortType.date);
  final Rx<int?> selectedYear = Rx<int?>(3);
  final Rx<String?> selectedBatch = Rx<String?>(null);
  final firestoreService = Get.find<FirestoreService>();
  late final StreamSubscription<List<UserInfo>> subscription;
  List<UserInfo> allUsersList = [];
  List<UserInfo> _filteredUsersList = [];

  LinkedHashMap<String, int> batches = LinkedHashMap<String, int>();

  @override
  void onReady() {
    subscription = firestoreService.userInfoDatasources.streamAllUserList
        .listen((event) => _subscriptionUpdate(event));
    selectedYear.listen((_) => update());
    userSortType.listen((_) => update());
    selectedBatch.listen((_) => update());
    super.onReady();
  }

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

  void _subscriptionUpdate(List<UserInfo> users) {
    allUsersList = users;
    _updateYearWiseUserCount;
    update();
  }

  void get _updateYearWiseUserCount => yearWiseUserCount.value = [
        allUsersList.where((element) => element.year == 1).length,
        allUsersList.where((element) => element.year == 2).length,
        allUsersList.where((element) => element.year == 3).length
      ];

  LinkedHashMap<String, int> batchList(List<UserInfo> users) {
    Map<String, int> batchWiseStudentCount = {" Show All": users.length};

    for (final user in users) {
      batchWiseStudentCount[user.batch] =
          batchWiseStudentCount.containsKey(user.batch)
              ? batchWiseStudentCount[user.batch]! + 1
              : 1;
    }

    final sortKey = batchWiseStudentCount.keys.toList(growable: false)
      ..sort((a, b) => a.compareTo(b));

    return LinkedHashMap<String, int>.fromIterable(sortKey,
        key: (key) => key, value: (key) => batchWiseStudentCount[key] ?? -1);
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }
}
