abstract class CacheBoxUsecase {
  Future<void> saveRequest(String key, Map<String, dynamic> map);
  Future<Map<String, dynamic>?> getRequest(String key,
      {int? expirationHour, required bool delete});
  Future<void> deleteRequest(String key);
  Future<bool> isExpired(String key);
}
