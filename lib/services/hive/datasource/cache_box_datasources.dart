import '../repository/hive_database.dart';
import 'package:hive/hive.dart';

import '../models/user_info.dart';

const int cacheExpiresHour = 12;

/// Data source class for caching data using Hive.
class CacheBoxDataSources {
  final HiveDatabase hiveDatabase;
  final Box cacheBox;
  CacheBoxDataSources(this.cacheBox, this.hiveDatabase);

  /// Saves the [data] in the cache with the specified [key].
  /// If the [data] type is [UserInfo], it also updates the [userInfo] value in the [userBoxDatasources].
  /// The cache key is stored as [key], and the current timestamp is stored as ["${key}_time"].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// await saveCache<UserInfo>(userInfoData, "user_info");
  /// ```
  Future<void> saveCache<T>(T data, String key) async {
    final cacheKey = key;
    await cacheBox.put(cacheKey, data);
    await cacheBox.put("${cacheKey}_time", DateTime.now());

    if (T == UserInfo) {
      hiveDatabase.userBoxDatasources.userInfo.value = data as UserInfo;
    }
  }

  /// Clears all the cache in the cache box.
  ///
  /// Returns a [Future] that completes when the cache is cleared.
  Future<void> clearAllCache() async => await cacheBox.clear();

  /// Retrieves the cache time for a given key from the cache box.
  /// Returns the cache time as a [DateTime] object if it exists, otherwise returns null.
  ///
  /// Parameters:
  /// - [key]: The key for which to retrieve the cache time.
  ///
  /// Returns:
  /// The cache time as a [DateTime] object if it exists, otherwise returns null.
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

  /// Retrieves the cached value associated with the given [key].
  /// Returns the cached value if it exists and matches the type [T],
  /// otherwise returns null.
  ///
  /// Parameters:
  /// - [key]: The key used to identify the cached value.
  ///
  /// Returns:
  /// - The cached value if it exists and matches the type [T],
  ///   otherwise returns null.
  ///
  /// Throws:
  /// - [Exception]: If an error occurs while retrieving the cached value.
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

  /// Deletes the cache entry with the given [key] from the cache box.
  ///
  /// This method deletes the cache entry with the given [key] from the cache box.
  /// It also deletes the corresponding time entry associated with the cache entry.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// await deleteCache("user_data");
  /// ```
  Future<void> deleteCache<T>(String key) async {
    await cacheBox.delete(key);
    await cacheBox.delete("${key}_time");
  }
}
