import 'package:class_link/services/auth/repository/auth_service_repo.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../firebase/repository/firestore_service.dart';
import '../../hive/repository/hive_database.dart';

const String emailFix = "email_fix";

mixin UserPatchMixin {
  Future<void> get thirdYearEmailPatch async {
    final hiveDatabase = Get.find<HiveDatabase>();
    final fixed = hiveDatabase.userInfoBox.get(emailFix, defaultValue: false);
    if (!fixed) {
      final firestoreService = Get.find<FirestoreService>();
      final user = await firestoreService.userInfoDatasources.getUserInfo;
      if (user != null) {
        if (user.id.endsWith('@kiit.ac.in')) {
          await hiveDatabase.userInfoBox.put(emailFix, true);
        } else {
          final authService = Get.find<AuthService>();
          final email = authService.getUser?.email;
          if (email != null) {
            await firestoreService.userInfoDatasources.updateUser(
              user.copyWith(refId: user.id, id: email, role: 'viewer'),
            );
          }
          await hiveDatabase.userInfoBox.put(emailFix, true);
        }
      }
    }
  }

  // Future<void> _recreateUser(HiveDatabase hiveDatabase) async {
  //   await Get.find<FirestoreService>()
  //       .userInfoDatasources
  //       .deleteUser(hiveDatabase.userBox.userInfo!);
  //   await hiveDatabase.userBox.clearUserInfo;

  //   Get.offAllNamed(Routes.USER_BATCH);
  // }
}
