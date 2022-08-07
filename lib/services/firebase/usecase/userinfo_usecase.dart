import '../../hive/models/user_info.dart';

abstract class UserInfoUsecase {
  Future<UserInfo?> get getUserInfo;
  Future<bool> addUserInfo(UserInfo user);
  Stream<List<UserInfo>> get streamAllUserList;
  Stream<List<UserInfo>> get streamUserList;
  Future<bool> updateUser(UserInfo user);
  Future<List<UserInfo>> myBatch([bool filterById = true]);
  Future<void> deleteUser(UserInfo userInfo);
}
