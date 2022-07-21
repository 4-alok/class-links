abstract class ChacheBoxUsecase {
  Future<void> saveRequest(String key, Map<String, dynamic> map);
  Future<Map<String, dynamic>?> getRequest(String key, [int? expirationHour]);
}
