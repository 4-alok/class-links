import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

const String USER_INFO = 'user_info';

class HiveDatabase extends GetxService {
  late final Box userInfo;

  Future<void> initDatabase() async {
    userInfo = await Hive.openBox('userInfo');
  }

  Future<void> setUserInfo(UserInfo userInfo) async {
    if (this.userInfo.isEmpty) {
      await this.userInfo.put(USER_INFO, userInfo.toJson());
    } else {
      await this.userInfo.clear();
      await this.userInfo.put(USER_INFO, userInfo.toJson());
    }
  }

  Future<UserInfo?> getUserInfo() async {
    print(1);
    print(UserInfo.fromJson(await userInfo.values.first));
    print(10);
    return (await userInfo.isEmpty)
        ? null
        : UserInfo.fromJson(await userInfo.values.first);
  }
}
