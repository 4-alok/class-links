import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../services/auth/repository/auth_service_repo.dart';
import '../../services/firebase/datasource/userinfo_datasource.dart';
import '../../services/firebase/repository/firestore_service.dart';
import 'csv_utils.dart';

class Patch {
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  FirestoreService get firestoreService => Get.find<FirestoreService>();
  AuthService get authService => Get.find<AuthService>();

  Future<void> init() async {
    await patch1();
  }

  Future<void> patch1() async {
    final user = hiveDatabase.userBoxDatasources.userInfo;
    final roll = int.tryParse((user?.id ?? "").split('@').first) ?? 0;
    if (await isLateral(roll)) {
      if (user?.year == 2) {
        await hiveDatabase.clearBoxes;
        await firestoreService.userInfoDatasources.firestore
            .collection(userCollectionKey)
            .where('id', isEqualTo: user?.id)
            .limit(1)
            .get()
            .then((users) => users.docs.first.reference.delete());
        // await authService.logout;
        Get.offAllNamed(Routes.USER_BATCH);
      }
    }
  }

  Future<bool> isLateral(int roll) async =>
      (await CsvUtils.readCSVFile('assets/database/3rd_year/6_sem_user.csv'))
          .map<int>((e) => e.first)
          .where((e) => e.toString().startsWith('21'))
          .contains(roll);

  // Future<List<int>?> getR() async =>
  //     (await CsvUtils.readCSVFile('assets/database/3rd_year/6_sem_user.csv'))
  //         .map<int>((e) => e.first)
  //         .where((e) => e.toString().startsWith('21'))
  //         .toList();

  /// It checks if the roll number is present in the user list.
  ///
  /// Args:
  ///   rollNo (int): The roll number of the user.
  static Future<bool> isRollNoInUserList(int rollNo) async =>
      (await CsvUtils.readCSVFile('assets/database/3rd_year/6_sem_user.csv'))
          .map((e) => e.first)
          .contains(rollNo);
}
