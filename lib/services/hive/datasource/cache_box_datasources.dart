import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../auth/repository/auth_service_repo.dart';
import '../usecase/cache_usecase.dart';

// const int cacheExpiresHour = 12;

class CacheBoxDataSources implements ChacheBoxUsecase {
  final Box chacheBox;
  CacheBoxDataSources(this.chacheBox);

  int get cacheExpiresHour =>
      Get.find<AuthService>().getUser?.email?.startsWith('21') ?? false
          ? 1
          : 12;

  @override
  Future<Map<String, dynamic>?> getRequest(String key,
      [int? expirationHour]) async {
    final value = await chacheBox.get(key);
    if (value == null) return null;
    final data = jsonDecode(await chacheBox.get(key));
    if ((DateTime.parse(data['date'])).difference(DateTime.now()).inHours >
        (expirationHour ?? cacheExpiresHour)) {
      await chacheBox.delete(key);
      return null;
    } else {
      return jsonDecode(data['data']);
    }
  }

  @override
  Future<void> saveRequest(String key, Map<String, dynamic> map) async =>
      await chacheBox.put(
          key,
          jsonEncode(
            {"data": jsonEncode(map), "date": DateTime.now().toIso8601String()},
          ));
}
