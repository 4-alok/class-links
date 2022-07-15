import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../firebase/firestore_service.dart';
import '../hive/hive_database.dart';

mixin FirstYearPreviousUserPatchMixin {
  List<String> get _firstYearScheme1 =>
      List.generate(27, (index) => "A${index + 1}");

  List<String> get _firstYearScheme2 =>
      List.generate(30, (index) => "B${index + 1}");

  Future<void> get firstYearPreviousUserPatchMixin async {
    final hiveDatabase = Get.find<HiveDatabase>();
    final userInfo = hiveDatabase.userInfo;
    if (userInfo != null) {
      if (_firstYearScheme1.contains(userInfo.batch)) {
        await _recreateUser(hiveDatabase);
      } else if (_firstYearScheme2.contains(userInfo.batch)) {
        await _recreateUser(hiveDatabase);
      }
    }
  }

  Future<void> _recreateUser(HiveDatabase hiveDatabase) async {
    await Get.find<FirestoreService>().deleteUser(hiveDatabase.userInfo!);
    await hiveDatabase.clearUserInfo();

    Get.offAllNamed(Routes.USER_BATCH);
  }
}
