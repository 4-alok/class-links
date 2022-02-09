import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../models/user_info/user_info.dart';
import '../../../services/firestore_service.dart';

enum UserFilter { id, date, name }

class AdminController extends GetxController {
  final scrollController = ScrollController(initialScrollOffset: 100);
  final userFilter = Rx<UserFilter>(UserFilter.id);
  final batch = Rx<String?>(null);
  bool batchReady = false;

  List<String> batches = [];

  Future<List<UserInfo>> get userList async {
    late final List<UserInfo> users;
    if (batch.value != null) {
      if (batch.value == " None") {
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
        users.sort((a, b) => a.id.compareTo(b.id));
        return users;
      case UserFilter.date:
        users.sort((a, b) => a.date.compareTo(b.date));
        return users;
      case UserFilter.name:
        users.sort((a, b) => a.userName.compareTo(b.userName));
        return users;
    }
  }

  List<String> _batchList(List<UserInfo> users) {
    List<String> batches = [" None"];
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
