import '../../../services/auth/extension/app_user_type.dart';
import '../../../services/gsheet/repository/gsheet_service.dart';
import '../../../services/hive/models/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/auth/models/user_type.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
// import '../../../services/hive/models/user_info.dart' as class_link_user;

class AuthController extends GetxController {
  final loading = RxBool(false);
  final hiveDatabase = Get.find<HiveDatabase>();
  GSheetService get sheetService => Get.find<GSheetService>();
  FirestoreService get firestoreService => Get.find<FirestoreService>();

  Future<bool> handleLogin() async {
    loading.value = true;

    // check firebaseUser already login or not
    if (Get.find<AuthService>().user.value != null) {
      loading.value = false;
      return true;
    }

    /// Calling the login method of AuthService class (Google Login).
    final auth.User? firebaseUser = await Get.find<AuthService>().login;

    if (firebaseUser != null) {
      // Get the user type from the firebaseUser object
      final appUserType = await firebaseUser.userType;
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
          final userInfo = await tryRetrieve(firebaseUser.email ?? "");
          if (userInfo != null) {
            await hiveDatabase.userBoxDatasources.setUserInfo(userInfo);
            loading.value = false;
            Get.offNamed(Routes.HOME);
            // return Routes.HOME;
          } else {
            loading.value = false;
            return true;
            // Get.offNamed(Routes.BATCH_SELECTION);
          }
          break;
      }
    }
    loading.value = false;
    return false;
  }

  /// Retrieves user info from Firestore and saves it to Hive database if it doesn't exist already.
  Future<UserInfo?> tryRetrieve(String email) async {
    // First check if the user info exists in the Google Sheet
    final sheetUserInfo =
        (await sheetService.gSheetUserInfoDatasources.getAllUserList())
            .firstWhereOrNull((element) => element.id == email);

    if (sheetUserInfo != null) {
      return sheetUserInfo;
    } else {
      // If the user info doesn't exist in the Google Sheet, check if it exists in the Firestore database
      final UserInfo? firebaseUserInfo =
          (await firestoreService.userInfoDatasources.getAllUserList)
              .firstWhereOrNull(
        (element) => element.id == email,
      );

      if (firebaseUserInfo != null) {
        await hiveDatabase.userBoxDatasources.setUserInfo(firebaseUserInfo);
        return firebaseUserInfo;
      } else {
        return null;
      }
    }
  }
}
