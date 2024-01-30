// import 'package:get/get.dart';

// // import '../../routes/app_pages.dart';
// // import '../../services/hive/models/user_info.dart';
// import '../../services/hive/repository/hive_database.dart';

// class Patch {
//   HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
//   // FirestoreService get firestoreService => Get.find<FirestoreService>();
//   // AuthService get authService => Get.find<AuthService>();

//   // Future<void> get init async => await patch1();

//   // Future<void> patch1() async {
//   //   final UserInfo? user = hiveDatabase.userBoxDatasources.userInfo.value;

//   //   // Delete user info if user.date is has passed this Date 22-June-2023]
//   //   if (user?.joiningDate.isBefore(DateTime(2023, 6, 22)) ?? false) {
//   //     await hiveDatabase.cacheBoxDataSources.clearAllCache();
//   //     // await firestoreService.userInfoDatasources.firestore
//   //     //     .collection(userCollectionKey)
//   //     //     .where('id', isEqualTo: user?.id)
//   //     //     .limit(1)
//   //     //     .get()
//   //     //     .then((users) => users.docs.first.reference.delete());
//   //     // await authService.logout;
//   //     Get.offAllNamed(Routes.BATCH_SELECTION);
//   //   }

//   //   //   final roll = int.tryParse((user?.id ?? "").split('@').first) ?? 0;
//   //   //   if (await isLateral(roll)) {
//   //   //     if (user?.year == 2) {
//   //   //       await hiveDatabase.clearBoxes;
//   //   //       await firestoreService.userInfoDatasources.firestore
//   //   //           .collection(userCollectionKey)
//   //   //           .where('id', isEqualTo: user?.id)
//   //   //           .limit(1)
//   //   //           .get()
//   //   //           .then((users) => users.docs.first.reference.delete());
//   //   //       // await authService.logout;
//   //   //       Get.offAllNamed(Routes.USER_BATCH);
//   //   //     }
//   //   //   }
//   // }

//   // Future<bool> isLateral(int roll) async =>
//   //     (await CsvUtils.readCSVFile('assets/database/3rd_year/6_sem_user.csv'))
//   //         .map<int>((e) => e.first)
//   //         .where((e) => e.toString().startsWith('21'))
//   //         .contains(roll);

//   // Future<List<int>?> getR() async =>
//   //     (await CsvUtils.readCSVFile('assets/database/3rd_year/6_sem_user.csv'))
//   //         .map<int>((e) => e.first)
//   //         .where((e) => e.toString().startsWith('21'))
//   //         .toList();

//   // /// It checks if the roll number is present in the user list.
//   // ///
//   // /// Args:
//   // ///   rollNo (int): The roll number of the user.
//   // static Future<bool> isRollNoInUserList(int rollNo) async =>
//   //     (await CsvUtils.readCSVFile('assets/database/3rd_year/6_sem_user.csv'))
//   //         .map((e) => e.first)
//   //         .contains(rollNo);
// }
