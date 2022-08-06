
import '../../../app/models/user_info/user_info.dart';

abstract class UserBoxUsecase {
  Future<void> setUserInfo(UserInfo userInfo);
  Future<void> get clearUserInfo;
  Future<UserInfo?> get getUserInfo;
}
