import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth/auth_service.dart';
import 'package:class_link/app/services/firebase/firestore_service.dart';
import 'package:get/get.dart';

import '../hive/hive_database.dart';

class FirstYearPreviousUserPatch {
  List<String> get firstYearScheme1 =>
      List.generate(27, (index) => "A${index + 1}");

  List<String> get firstYearScheme2 =>
      List.generate(30, (index) => "B${index + 1}");

  Future<void> get patch async {
    final hiveDatabase = Get.find<HiveDatabase>();
    final userInfo = hiveDatabase.userInfo;
    if (userInfo != null) {
      if (firstYearScheme1.contains(userInfo.batch)) {
        await recreateUser(hiveDatabase);
      } else if (firstYearScheme2.contains(userInfo.batch)) {
        await recreateUser(hiveDatabase);
      }
    }
  }

  Future<void> recreateUser(HiveDatabase hiveDatabase) async {
    await Get.find<FirestoreService>().deleteUser(hiveDatabase.userInfo!);
    await hiveDatabase.clearUserInfo();

    Get.offAllNamed(Routes.USER_BATCH);
  }
}
