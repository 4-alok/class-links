import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:class_link/services/hive/utils/cache_key.dart';
import 'package:get/get.dart';

import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/hive/models/user_info.dart';

/// > A class that contains methods that are used to determine if the user is in the 3rd year or if the
/// user is viewing his/her own profile
class MyBatchController extends GetxController {
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  /// A getter that returns true if the user is in the 3rd year.
  bool get is3rdYear => hiveDatabase.userBoxDatasources.userInfo?.year == 3;

  /// > If the userName of the current user is the same as the userName of the user whose profile is being
  /// viewed, then return true
  ///
  /// Args:
  ///   userName (String): The user name of the user whose profile you want to open.
  bool isMe(String userName) =>
      hiveDatabase.userBoxDatasources.userInfo?.userName == userName;

  Future<UserInfoList?> getUserInfoList() async {
    final data = await hiveDatabase.getFromCacheOrFetch<UserInfoList>(
        key: CacheKey.MY_BATCH,
        checkExpired: true,
        duration: const Duration(days: 1),
        fetchData: Get.find<FirestoreService>().userInfoDatasources.myBatch);
    return data;
  }
}
