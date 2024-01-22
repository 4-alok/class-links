import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:hive/hive.dart';

import '../models/user_info.dart';
import '../usecase/cache_usecase.dart';

const int cacheExpiresHour = 12;

class CacheBoxDataSources implements CacheBoxUsecase {
  final HiveDatabase hiveDatabase;
  final Box cacheBox;
  CacheBoxDataSources(this.cacheBox, this.hiveDatabase);

  Future<void> saveCache<T>(T data, String key) async {
    final cacheKey = key;
    await cacheBox.put(cacheKey, data);
    await cacheBox.put("${cacheKey}_time", DateTime.now());

    if (T == UserInfo) {
      hiveDatabase.userBoxDatasources.userInfo.value = data as UserInfo;
    }
  }

  Future<void> clearAllCache() async => await cacheBox.clear();

  Future<DateTime?> getCacheTime<T>(String? key) async {
    try {
      final value = await cacheBox.get("${key}_time");
      if (value == null) {
        return null;
      } else {
        return value as DateTime;
      }
    } catch (e) {
      return null;
    }
  }

  Future<T?> getCache<T>(String key) async {
    try {
      final value = await cacheBox.get(key);
      if (value == null) {
        return null;
      } else {
        return value as T;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteCache<T>(String key) async {
    await cacheBox.delete(key);
    await cacheBox.delete("${key}_time");
  }
}
