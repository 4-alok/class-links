import 'package:class_link/services/firebase/repository/firestore_service.dart';
import 'package:get/get.dart';

import '../../../services/hive/datasource/cache_box_datasources.dart';
import '../../../services/hive/repository/hive_database.dart';

// const testKey = "test";
const cacheDataSample = {'test': 'test'};

class CacheTestingController {
  late final HiveDatabase hiveDatabase;
  late final CacheBoxDataSources cache;
  CacheTestingController() {
    hiveDatabase = Get.find<HiveDatabase>();
    cache = hiveDatabase.cacheBoxDataSources;
  }

  final testKey =
      Get.find<FirestoreService>().timetableDatasource.batchTimeTableKey;

  final isEmpty = Rx<bool?>(null);
  final isExpired = Rx<bool?>(null);

  Future<void> get isCacheBoxEmpty async =>
      isEmpty.value = await cache.getRequest(testKey, delete: false) == null;

  Future<void> get isCacheExpired async =>
      isExpired.value = await cache.isExpired(testKey);

  Future<void> get addCacheData async {
    await cache.saveRequest(testKey, cacheDataSample);
    await isCacheBoxEmpty;
    await isCacheExpired;
  }

  Future<void> get deleteCacheData async {
    await cache.deleteRequest(testKey);
    await isCacheBoxEmpty;
    await isCacheExpired;
  }

  Future<void> get makeCacheExpired async => await cache.makeExpired(testKey);

  void dispose() {
    isEmpty.close();
    isExpired.close();
  }
}
