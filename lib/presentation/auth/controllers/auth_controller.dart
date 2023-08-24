import 'package:class_link/services/auth/extension/app_user_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/auth/models/user_type.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../services/hive/models/user_info.dart' as class_link_user;

class AuthController extends GetxController {
  final loading = RxBool(false);
  final hiveDatabase = Get.find<HiveDatabase>();

  Future<void> handleLogin() async {
    loading.value = true;

    /// Calling the login method of AuthService class.
    final User? user = await Get.find<AuthService>().login;

    if (user != null) {
      // Get the user type from the user object
      final appUserType = await user.userType;
      // Use a switch statement to handle different user types
      switch (appUserType) {
        // If the user type is none, navigate to the NON_KIITIAN route
        case AppUserType.none:
          Get.offNamed(Routes.NON_KIITIAN);
          break;
        // If the user type is kiitian, navigate to the RESOURCES route
        case AppUserType.kiitian:
          Get.offNamed(Routes.RESOURCES);
          break;
        // If the user type is appUser, process the user data and navigate to the appropriate route
        case AppUserType.appUser:
          // Call the tryRetrieveAndSaveUserInfo method to retrieve user info from Firestore and save it to Hive database if it doesn't exist already
          await tryRetrieveAndSaveUserInfo();
          // If the user info is not present in the Hive database, navigate to the BATCH_SELECTION route
          // Otherwise, navigate to the HOME route
          (hiveDatabase.userBoxDatasources.userInfo == null)
              ? Get.offNamed(Routes.BATCH_SELECTION)
              : Get.offNamed(Routes.HOME);
          break;
      }
    }
    loading.value = false;
    return;
  }

  /// Retrieves user info from Firestore and saves it to Hive database if it doesn't exist already.
  Future<void> tryRetrieveAndSaveUserInfo() async {
    if (hiveDatabase.userBoxDatasources.userInfo == null) {
      final class_link_user.UserInfo? userInfo =
          await Get.find<FirestoreService>().userInfoDatasources.getUserInfo;
      if (userInfo != null) {
        await hiveDatabase.userBoxDatasources.setUserInfo(userInfo);
      }
    }
  }
}
