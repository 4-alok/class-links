import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../global/utils/filter_user_by_id.dart';
import '../../../services/hive/models/user_info.dart';

enum UserFilter { id, date }

const List<String> filterOptions = ['ID', 'Date'];

class AdminController extends GetxController {
  final scrollController = ScrollController(initialScrollOffset: 100);
  final userFilter = Rx<UserFilter>(UserFilter.id);
  final batch = Rx<String?>(null);
  bool batchReady = false;

  LinkedHashMap<String, int> batches = LinkedHashMap<String, int>();

  Map<String, int> batchWiseStudentCount = {};

  void updateFilter(String filter) {
    switch (filter) {
      case 'ID':
        userFilter.value = UserFilter.id;
        break;
      case 'Date':
        userFilter.value = UserFilter.date;
        break;
    }
    batch.update((val) => Get.back());
  }

  List<UserInfo> userList(List<UserInfo> listUserInfo) {
    late final List<UserInfo> users;
    if (batch.value != null) {
      if (batch.value == " Show All") {
        users = listUserInfo;
      } else {
        users = listUserInfo
            .where((element) => element.batch == batch.value)
            .toList();
      }
    } else {
      users = listUserInfo;
    }
    if (!batchReady) {
      batches = _batchList(users);
      batchReady = true;
    }

    switch (userFilter.value) {
      case UserFilter.id:
        return filterById(users);
      case UserFilter.date:
        users.sort((a, b) => b.date.compareTo(a.date));
        return users;
    }
  }

  LinkedHashMap<String, int> _batchList(List<UserInfo> users) {
    Map<String, int> batchWiseStudentCount = {" Show All": users.length};

    for (final user in users) {
      if (batchWiseStudentCount.containsKey(user.batch)) {
        batchWiseStudentCount[user.batch] =
            batchWiseStudentCount[user.batch]! + 1;
      } else {
        batchWiseStudentCount[user.batch] = 1;
      }
    }

    final sortKey = batchWiseStudentCount.keys.toList(growable: false)
      ..sort((a, b) => a.compareTo(b));

    return LinkedHashMap<String, int>.fromIterable(
      sortKey,
      key: (key) => key,
      value: (key) => batchWiseStudentCount[key] ?? -1,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    batch.close();
    super.dispose();
  }
}
