import 'package:get/get.dart';

import '../../../../global/extension/string.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/firebase/models/user_section.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../services/hive/models/user_info.dart';

mixin AutoCreateUser {
  Future<void> autoCreateUserFor3rdYear(UserSecetion userSection) async {
    final user = Get.find<AuthService>().getUser!;
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
        role: 'viewer',
        date: DateTime.now());

    final res =
        await Get.find<FirestoreService>().userInfoDatasources.getUserInfo;
    if (res == null) {
      if (await Get.find<FirestoreService>()
          .userInfoDatasources
          .addUserInfo(userInfo)) {
        await Get.find<HiveDatabase>().userBox.setUserInfo(userInfo);
        Get.offAllNamed(Routes.HOME);
      }
    } else {
      await Get.find<HiveDatabase>().userBox.setUserInfo(res);
      Get.offAllNamed(Routes.HOME);
    }
  }
}
