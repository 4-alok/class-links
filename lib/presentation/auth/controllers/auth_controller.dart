import 'package:class_link/services/auth/extension/app_user_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../global/utils/app_update.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth/models/user_type.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../services/hive/models/user_info.dart' as class_link_user;

class AuthController extends GetxController {
  final loading = RxBool(false);
  final hiveDatabase = Get.find<HiveDatabase>();

  @override
  void onReady() {
    AndroidAppUpdate();
    super.onReady();
  }

  Future<void> login() async {
    loading.value = true;
    final User? user = await Get.find<AuthService>().login;

    if (user != null) {
      if (await user.userType != AppUserType.appUser) {
        Get.offNamed(Routes.NON_KIITIAN);
      } else {
        // Get user information from firebase if not present in hive database
        // and save to hive database
        if (hiveDatabase.userBoxDatasources.userInfo == null) {
          final class_link_user.UserInfo? userInfo =
              await Get.find<FirestoreService>()
                  .userInfoDatasources
                  .getUserInfo;
          if (userInfo != null) {
            await hiveDatabase.userBoxDatasources.setUserInfo(userInfo);
          }
        }

        hiveDatabase.userBoxDatasources.userInfo == null
            ? Get.offNamed(Routes.USER_BATCH)
            : Get.offNamed(Routes.HOME);
      }
      loading.value = false;
    }
  }
}
