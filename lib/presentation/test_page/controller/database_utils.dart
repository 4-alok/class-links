import 'package:class_link/global/utils/get_snackbar.dart';
import 'package:get/get.dart';

import '../../../services/auth/repository/auth_service_repo.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/gsheet/repository/gsheet_service.dart';
import '../../../services/hive/repository/hive_database.dart';

class DatabaseUtilsController {
  GSheetService get gsheetService => Get.find<GSheetService>();
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  FirestoreService get firestoreService => Get.find<FirestoreService>();

  Future<void> get deleteMeFromFirestore async =>
      await firestoreService.userInfoDatasources.firestore
          .collection('userv2')
          .where('id', isEqualTo: Get.find<AuthService>().getUser!.email)
          .limit(1)
          .get()
          .then((users) => users.docs.first.reference.delete())
          .then((_) => Message("Deleted", "Deleted from firestore"));

  void test() async {
    hiveDatabase.settingBoxDatasources.buildNo;
  }

  void test2() async {
    hiveDatabase.settingBoxDatasources.setBuildNo();
  }

  void test3() async {
    hiveDatabase.settingBoxDatasources.clearBuldNo();
  }

  void test4() async {
    // final k = await Patch().isLateral(21053059);
  }

  test6() async {
    // final k = await Patch.isRollNoInUserList(2005847);
    // print(k);
  }

  void test5() async {
    // final rolls = await Patch().getR() ?? [];
    // final allUserInfo = await firestoreService.userInfoDatasources.firestore
        // .collection(userCollectionKey)
        // .get();
    // for (var element in allUserInfo.docs) {
      // final userInfo = UserInfo.fromJson(element.data());
      // final roll = int.tryParse(userInfo.id.split('@').first) ?? 0;
      // if (rolls.contains(roll)) {
        // await element.reference.delete();
      // }
    // }
  }
}
