import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../datasource/cache_box_datasources.dart';
import '../datasource/setting_box_datasources.dart';
import '../datasource/user_box_datasources.dart';

/// It's a class that manages the Hive database and provides the data sources for the boxes
class HiveDatabase extends GetxService {
  // late final Box userInfoBox;
  late final Box settingsBox;
  late final Box cacheBox;

  late final SettingBoxDatasources settingBoxDatasources;
  late final UserBoxDatasources userBoxDatasources;
  late final CacheBoxDataSources cacheBoxDataSources;

  /// Initializes the Hive database by opening three boxes: userInfo, settings, and cache.
  /// It also sets the data sources for each box and initializes them.
  ///
  /// Example usage:
  /// ```
  /// await initDatabase();
  /// ```
  Future<void> get initDatabase async {
    settingsBox = await Hive.openBox('settings');
    cacheBox = await Hive.openBox('cache');

    /// Initializes the [settingBoxDatasources] with the [settingsBox] instance.
    settingBoxDatasources = SettingBoxDatasources(settingsBox);

    /// Initializes the [userBoxDatasources] with the [userInfoBox] instance.
    userBoxDatasources = UserBoxDatasources(cacheBox, this);

    /// Initializes the [cacheBoxDataSources] with the [cacheBox] instance.
    cacheBoxDataSources = CacheBoxDataSources(cacheBox, this);
    await userBoxDatasources.init;
    await settingBoxDatasources.init;
  }

  /// Closes the [userInfoBox], [settingsBox], and [cacheBox] instances and disposes of the [settingBoxDatasources].
  /// Also calls the [onClose] method of the parent class.
  @override
  Future<void> onClose() async {
    // await userInfoBox.close();
    await settingsBox.close();
    await cacheBox.close();
    settingBoxDatasources.dispose;
    userBoxDatasources.dispose;
    super.onClose();
  }

  /// Fetches data from the cache if available, otherwise fetches it from the server and caches it for future use.
  ///
  /// The [key] parameter is used to identify the data in the cache.
  /// The [duration] parameter specifies the duration for which the data should be considered valid.
  /// The [fetchData] parameter is a function that fetches the data from the server.
  /// The [preProcessTasks] parameter is an optional list of functions that perform pre-processing tasks on the fetched data.
  ///
  /// Returns a stream of the cached data or the fetched data.
  Stream<T?> streamCachedDataOrFetch<T>({
    required String key,
    required Duration duration,
    required Future<T?> Function() fetchData,
    List<Future<T> Function(T)>? preProcessTasks,
  }) async* {
    // get the cached data
    final cacheData = await cacheBoxDataSources.getCache<T>(key);
    // yield the cached data
    if (cacheData != null) {
      // yield the cached data
      yield cacheData;
      // get the time at which the data was cached
      final time = await cacheBoxDataSources.getCacheTime<T>(key);
      // calculate the expiry time
      final expiry = time!.add(duration);
      // if the cached data is expired
      if (DateTime.now().isAfter(expiry)) {
        // fetch the data from the server
        final fetchedData = await fetchData();
        // if the fetched data is not null
        if (fetchedData != null) {
          // yield the fetched data
          yield fetchedData;
          // if preProcessTask is not null
          if (preProcessTasks != null) {
            T processedData = fetchedData;
            // here we are looping through the preProcessTasks and executing them
            // by modifying the fetchedData and yielding it
            for (Future<T> Function(T) preProcessTask in preProcessTasks) {
              processedData = await preProcessTask(processedData);
              if (processedData != null) {
                yield processedData;
              }
            }
            // save the processed data to the cache
            await cacheBoxDataSources.saveCache<T>(processedData, key);
          } else {
            // save the fetched data to the cache if preProcessTasks is null
            await cacheBoxDataSources.saveCache<T>(fetchedData, key);
          }
        }
      }
    } else {
      // fetch the data from the server
      final fetchedData = await fetchData();
      // if the fetched data is not null
      if (fetchedData != null) {
        // yield the fetched data
        yield fetchedData;
        // if preProcessTask is not null
        if (preProcessTasks != null) {
          T processedData = fetchedData;
          // here we are looping through the preProcessTasks and executing them
          // by modifying the fetchedData and yielding it
          for (Future<T> Function(T) preProcessTask in preProcessTasks) {
            processedData = await preProcessTask(processedData);
            if (processedData != null) {
              // yield the processed data
              yield processedData;
            }
          }
          // save the processed data to the cache
          await cacheBoxDataSources.saveCache<T>(processedData, key);
        } else {
          // save the fetched data to the cache
          await cacheBoxDataSources.saveCache<T>(fetchedData, key);
        }
      }
    }
  }

  Future<T?> getFromCacheOrFetch<T>({
    Duration? duration,
    bool checkExpired = false,
    bool onlyFetch = false,
    bool onlyCache = false,
    // mean that the data will be fetched from the server if expired else it will return null
    bool fetchIfExpired = false,
    Future<T?> Function()? fetchData,
    required String key,
  }) async {
    // if onlyFetch is TRUE
    if (onlyFetch) {
      if (fetchData != null) {
        final fetchedData = await fetchData();
        if (fetchedData != null) {
          await cacheBoxDataSources.saveCache<T>(fetchedData, key);
          return fetchedData;
        } else {
          return null;
        }
      } else {
        throw Exception('fetchData function is null');
      }
    }

    // if onlyCache is TRUE
    if (onlyCache) {
      final res = await cacheBoxDataSources.getCache<T>(key);
      if (res != null) {
        return res;
      } else {
        return null;
      }
    }

    final cacheData = await cacheBoxDataSources.getCache<T>(key);
    if (cacheData != null) {
      if (checkExpired) {
        final time = await cacheBoxDataSources.getCacheTime<T>(key);
        final expiry = time!.add(duration!);
        if (DateTime.now().isAfter(expiry)) {
          if (fetchIfExpired) {
            if (fetchData != null) {
              final fetchedData = await fetchData();
              if (fetchedData != null) {
                await cacheBoxDataSources.saveCache<T>(fetchedData, key);
                return fetchedData;
              } else {
                return null;
              }
            } else {
              throw Exception('fetchData function is null');
            }
          } else {
            return null;
          }
        } else {
          return cacheData;
        }
      } else {
        return cacheData;
      }
    } else {
      if (fetchData != null) {
        final fetchedData = await fetchData();
        if (fetchedData != null) {
          await cacheBoxDataSources.saveCache<T>(fetchedData, key);
          return fetchedData;
        } else {
          return null;
        }
      } else {
        throw Exception('fetchData function is null');
      }
    }
  }

  Future<void> updateCache<T>(T data, String key) async {
    await cacheBoxDataSources.saveCache<T>(data, key);
  }

  String fT(DateTime d) => "${d.hour}:${d.minute} ${d.hour > 12 ? "pm" : "am"}";
}
