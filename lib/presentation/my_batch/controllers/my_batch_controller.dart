import 'package:get/get.dart';

import '../../../services/gsheet/repository/gsheet_service.dart';
import '../../../services/hive/models/user_info.dart';
import '../../../services/hive/repository/hive_database.dart';
import '../../../services/hive/utils/cache_key.dart';

/// > A class that contains methods that are used to determine if the user is in the 3rd year or if the
/// user is viewing his/her own profile
class MyBatchController extends GetxController {
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  bool isMe(String userName) =>
      hiveDatabase.userBoxDatasources.userInfo.value?.userName == userName;

  Future<UserInfoList?> getUserInfoList() async {
    final data = await hiveDatabase.getFromCacheOrFetch<UserInfoList>(
      key: CacheKey.ALL_USER_LIST,
      checkExpired: true,
      duration: const Duration(days: 1),
      fetchData: _getUserInfoList,
    );
    final userInfo = hiveDatabase.userBoxDatasources.userInfo.value;
    final res = (data?.list ?? [])
        .where((UserInfo e) =>
            (e.batch == userInfo?.batch) && (e.semester == userInfo?.semester))
        .toList();
    return UserInfoList(list: res);
  }

  Future<UserInfoList> _getAllUserList() async => UserInfoList(
      list: await Get.find<GSheetService>()
          .gSheetUserInfoDatasources
          .getAllUserList());

  Future<UserInfoList> _getUserInfoList() async {
    final userInfoList = UserInfoList(
      list: (await Get.find<HiveDatabase>().getFromCacheOrFetch<UserInfoList>(
                  checkExpired: true,
                  duration: const Duration(hours: 1),
                  key: CacheKey.ALL_USER_LIST,
                  fetchData: _getAllUserList))
              ?.list ??
          [],
    );
    return userInfoList;
  }
}
