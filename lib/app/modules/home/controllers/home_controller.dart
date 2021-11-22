import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:class_link/app/services/local_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserInfo? userInfo;

  @override
  void onInit() async {
    await getUserInfo();
    super.onInit();
  }

  Future<UserInfo?> getUserInfo() async {
    final result = await Get.find<HiveDatabase>().getUserInfo();
    if (result != null) {
      userInfo = result;
      return userInfo;
    } else {
      final result2 = await Get.find<FirestoreService>().getUserInfo();
      if (result2 != null) {
        await Get.find<HiveDatabase>().setUserInfo(result2);
        userInfo = result2;
        return userInfo;
      } else {
        Get.offNamed(Routes.USER_INFO);
        return null;
      }
    }
  }

  Future<void> signout() async {
    final _authService = Get.find<AuthService>();
    await _authService.logout();
    Get.offAllNamed(Routes.AUTH);
  }
}
