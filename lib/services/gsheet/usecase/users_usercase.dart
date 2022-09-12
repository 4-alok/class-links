import '../../hive/models/user_info.dart';

abstract class GSheetUsersInfoUsecase {
  Future<List<UserInfo>> get getAllUserList;
  Future<bool> addUserInfo(UserInfo user);
}
