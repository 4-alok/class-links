import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

import '../usecase/cache_usecase.dart';

const int cacheExpiresHour = 12;

class CacheBoxDataSources implements CacheBoxUsecase {
  final Box cacheBox;
  CacheBoxDataSources(this.cacheBox);

  Future<List<Map<String, dynamic>>> autoCacheQuerySnapshot(
      {required Future<QuerySnapshot<Map<String, dynamic>>> Function()
          querySnapshot,
      required String key,
      int? expirationHour}) async {
    final cacheData = await getRequest(key);
    if (cacheData == null) {
      try {
        final data = await querySnapshot();
        await deleteRequest(key);
        await saveRequest(key, {for (final d in data.docs) d.id: d.data()});
        return data.docs.map((e) => e.data()).toList();
      } catch (e) {
        rethrow;
      }
    } else {
      if (await isExpired(key)) {
        try {
          final data = await querySnapshot();
          await deleteRequest(key);
          await saveRequest(key, {for (final d in data.docs) d.id: d.data()});
          return data.docs.map((e) => e.data()).toList();
        } catch (e) {
          return cacheData.entries
              .map<Map<String, dynamic>>((e) => e.value)
              .toList();
        }
      } else {
        final data = cacheData.entries
            .map<Map<String, dynamic>>((e) => e.value)
            .toList();
        return data;
      }
    }
  }

  @override
  Future<Map<String, dynamic>?> getRequest(String key) async {
    final value = await cacheBox.get(key);
    if (value == null) return null;
    return jsonDecode(jsonDecode(value)['data']);
  }

  @override
  Future<DateTime?> getCacheDate(String key) async {
    final value = await cacheBox.get(key);
    return (value == null) ? null : DateTime.parse(jsonDecode(value)['date']);
  }

  @override
  Future<void> saveRequest(String key, Map<String, dynamic> map) async =>
      await cacheBox.put(
          key,
          jsonEncode({
            "data": jsonEncode(map),
            "date": DateTime.now().toIso8601String()
          }));

  Future<void> makeExpired(String key) async {
    final res = await getRequest(key);
    if (res != null) {
      await cacheBox.put(
          key,
          jsonEncode(
            {"data": jsonEncode(res), "date": DateTime(1947).toIso8601String()},
          ));
    }
  }

  @override
  Future<void> deleteRequest(String key) async => await cacheBox.delete(key);

  @override
  Future<DateTime> getLastUpdated(String key) async {
    final value = await cacheBox.get(key);
    if (value == null) return DateTime(1947);
    return DateTime.parse(jsonDecode(value)['date']);
  }

  @override
  Future<bool> isExpired(String key) async {
    final value = await cacheBox.get(key);
    if (value == null) return true;
    final date = DateTime.parse(jsonDecode(value)['date'])
        .add(const Duration(hours: cacheExpiresHour));
    return date.difference(DateTime.now()).inHours.isNegative;
  }
}
