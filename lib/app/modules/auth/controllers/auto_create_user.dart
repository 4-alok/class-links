import 'package:class_link/app/global/extension/string.dart';
import 'package:get/get.dart';

import '../../../models/user_info/user_info.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/firebase/models/user_section.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/hive/hive_database.dart';

mixin AutoCreateUser {
  Future<void> autoCreateUserFor3rdYear(UserSecetion userSection) async {
    final user = Get.find<AuthService>().user!;
    final section = userSection.section;
    final index = section.getFirstNumericIndex;
    final stream = section.substring(0, index);
    final count = int.parse(section.substring(index!, section.length));
    final userInfo = UserInfo(
        id: user.email!,
        userName: user.displayName ?? "",
        slot: 1,
        year: 3,
        batch: "$stream-$count",
        stream: stream,
        date: DateTime.now());

    final res =
        await Get.find<FirestoreService>().userInfoDatasources.getUserInfo;
    if (res == null) {
      if (await Get.find<FirestoreService>()
          .userInfoDatasources
          .addUserInfo(userInfo)) {
        await Get.find<HiveDatabase>().setUserInfo(userInfo);
        Get.offAllNamed(Routes.HOME);
      }
    } else {
      await Get.find<HiveDatabase>().setUserInfo(res);
      Get.offAllNamed(Routes.HOME);
    }
  }
}
