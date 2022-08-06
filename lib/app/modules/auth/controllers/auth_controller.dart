import 'package:get/get.dart';

import '../../../../global/utils/app_update.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth/models/user_type.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import 'auto_create_user.dart';

class AuthController extends GetxController with AutoCreateUser {
  final loading = RxBool(false);

  @override
  void onReady() {
    AndroidAppUpdate();
    super.onReady();
  }

  Future<void> login() async {
    loading.value = true;
    final result = await Get.find<AuthService>().login;
    if (result == UserType.user) {
      final hiveDatabase = Get.find<HiveDatabase>();
      if (hiveDatabase.userBox.userInfo == null) {
        final userInfo =
            await Get.find<FirestoreService>().userInfoDatasources.getUserInfo;
        if (userInfo != null) {
          hiveDatabase.userBox.userInfo = userInfo;
          await hiveDatabase.userBox.setUserInfo(userInfo);
        }
      }

      final userSection = await Get.find<FirestoreService>()
          .electiveDatasources
          .getUserSection(local: true);
      if (userSection != null) {
        await autoCreateUserFor3rdYear(userSection);
      } else {
        hiveDatabase.userBox.userInfo == null
            ? Get.offNamed(Routes.USER_BATCH)
            : Get.offNamed(Routes.HOME);
      }
    } else if (result == UserType.kiitian || result == UserType.guest) {
      Get.offNamed(Routes.HOME);
    }
    loading.value = false;
  }
}
