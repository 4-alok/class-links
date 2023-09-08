import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_info.dart';
import '../utils/cache_key.dart';

class UserBoxDatasourcse {
  final HiveDatabase hiveDatabase;
  final Box cacheBox;
  UserBoxDatasourcse(this.cacheBox, this.hiveDatabase);

  UserInfo? userInfo;

  Future<void> get init async => userInfo = await getUserInfo;

  Future<UserInfo?> get getUserInfo async =>
      await hiveDatabase.getFromCacheOrFetch<UserInfo>(onlyCache: true, key: CacheKey.USER_INFO);

  Future<void> setUserInfo(UserInfo userInfo) async =>
      await cacheBox.put(CacheKey.USER_INFO, userInfo).then((value) async {
        await cacheBox.put("${CacheKey.USER_INFO}_time", DateTime.now());
        this.userInfo = userInfo;
      });

  Future<void> get clearUserInfo async => await cacheBox
      .delete(CacheKey.USER_INFO)
      .then((value) => userInfo = null);

  // /// Clear user info from the box and set it to null.
  // @override
  // Future<void> get clearUserInfo async =>
  //     await userInfoBox.clear().then((value) => userInfo = null);

  // /// Get user info from the box.
  // @override
  // Future<UserInfo?> get getUserInfo async => (userInfoBox.isEmpty)
  //     ? null
  //     : UserInfo.fromJson(jsonDecode(await userInfoBox.values.first));

  // /// [userInfo] is the user info to be stored in the box.
  // /// Clear the box and store the new user info.
  // @override
  // Future<void> setUserInfo(UserInfo userInfo) async {
  //   this.userInfo = userInfo;
  //   if (userInfoBox.isEmpty) {
  //     await _add(jsonEncode(userInfo.toJson()));
  //   } else {
  //     await userInfoBox.clear();
  //     await _add(jsonEncode(userInfo.toJson()));
  //   }
  // }

  // Future<void> _add(String data) async => await userInfoBox.put(0, data);
}
