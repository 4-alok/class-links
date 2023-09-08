import '../../hive/models/user_info.dart';

/// `UserInfoUsecase` is an abstract class that provides a set of methods to get, add, update, delete,
/// and reset user information
abstract class UserInfoUsecase {
  Future<UserInfo?> getUserInfo();
  Future<bool> addUserInfo(UserInfo user);
  Stream<List<UserInfo>> get streamAllUserList;
  Future<List<UserInfo>> get getAllUserList;
  Stream<List<UserInfo>> get streamUserList;
  Future<bool> updateUser(UserInfo user);
  Future<List<UserInfo>> myBatch();
  Future<void> deleteUser(UserInfo userInfo);
  Future<void> resetUser(String userId);
}
