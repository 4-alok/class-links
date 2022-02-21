import 'package:class_link/app/utils/filter_user_by_id.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../models/user_info/user_info.dart';
import '../../../services/firestore_service.dart';

enum UserFilter { id, date }

const List<String> filterOptions = ['ID', 'Date'];

class AdminController extends GetxController {
  final scrollController = ScrollController(initialScrollOffset: 100);
  final userFilter = Rx<UserFilter>(UserFilter.id);
  final batch = Rx<String?>(null);
  bool batchReady = false;

  List<String> batches = [];

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

  Future<List<UserInfo>> get userList async {
    late final List<UserInfo> users;
    if (batch.value != null) {
      if (batch.value == " Show All") {
        users = await Get.find<FirestoreService>().userList;
      } else {
        users = (await Get.find<FirestoreService>().userList)
            .where((element) => element.batch == batch.value)
            .toList();
      }
    } else {
      users = await Get.find<FirestoreService>().userList;
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

  List<String> _batchList(List<UserInfo> users) {
    List<String> batches = [" Show All"];
    for (final UserInfo userInfo in users) {
      if (!batches.contains(userInfo.batch)) {
        batches.add(userInfo.batch);
      }
    }
    batches.sort(((a, b) => a.compareTo(b)));
    return batches;
  }

  @override
  void dispose() {
    scrollController.dispose();
    batch.close();

    super.dispose();
  }
}
