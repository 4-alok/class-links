import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:class_link/app/services/local_database.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  void login() async {
    final result = await Get.find<AuthService>().login();
    if (result) {
      final hiveDatabase = Get.find<HiveDatabase>();
      if (hiveDatabase.userInfo == null) {
        final _userInfo = await Get.find<FirestoreService>().getUserInfo();
        if (_userInfo != null) {
          hiveDatabase.userInfo = _userInfo;
          await hiveDatabase.setUserInfo(_userInfo);
        }
      }

      hiveDatabase.userInfo == null
          ? Get.offNamed(Routes.USER_INFO)
          : Get.offNamed(Routes.HOME);
    }
  }
}
