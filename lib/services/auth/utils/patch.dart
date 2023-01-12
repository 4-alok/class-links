// import 'package:class_link/services/auth/repository/auth_service_repo.dart';
// import 'package:class_link/services/hive/models/user_info.dart';
// import 'package:get/get.dart';

// import '../../firebase/repository/firestore_service.dart';
// import '../../hive/repository/hive_database.dart';

// const String emailFix = "email_fix";

// mixin UserPatchMixin {
//   HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

//   bool? get emailFixed => hiveDatabase.userInfoBox.get(emailFix);

//   Future<void> setEmailFixed(bool value) async =>
//       await hiveDatabase.userInfoBox.put(emailFix, value);

//   Future<void> get thirdYearEmailPatch async {
//     final fixed = hiveDatabase.userInfoBox.get(emailFix, defaultValue: false);
//     if (!fixed) {
//       final firestoreService = Get.find<FirestoreService>();
//       final res = await firestoreService.userInfoDatasources.firestore
//           .collection("user")
//           .where("userName",
//               isEqualTo: Get.find<AuthService>().getUser!.displayName)
//           .get();
//       final user = UserInfo.fromJson(res.docs.first.data());
//       await firestoreService.userInfoDatasources.getUserInfo;
//       if (user.id.endsWith('@kiit.ac.in') &&
//           hiveDatabase.userBoxDatasources.userInfo!.id
//               .endsWith('@kiit.ac.in')) {
//       } else {
//         final authService = Get.find<AuthService>();
//         final email = authService.getUser?.email;
//         if (email != null) {
//           final fixedUserInfo = user.copyWith(
//             id: email,
//             role: 'viewer',
//             refId: res.docs.first.id,
//           );
//           await res.docs.first.reference.update(fixedUserInfo.toJson());
//           await hiveDatabase.userBoxDatasources.setUserInfo(fixedUserInfo);
//         }
//       }

//       if (res.docs.length > 1) {
//         for (final doc in res.docs.skip(1)) {
//           final userInfo = UserInfo.fromJson(doc.data());
//           if (!userInfo.id.endsWith('@kiit.ac.in')) {
//             await doc.reference.delete();
//           }
//         }
//       }
//       await hiveDatabase.userInfoBox.put(emailFix, true);
//     }
//   }

//   Future<void> get addDublicate async {
//     final firestoreService = Get.find<FirestoreService>();
//     await firestoreService.userInfoDatasources.firestore
//         .collection("user")
//         .add(hiveDatabase.userBoxDatasources.userInfo!.toJson());
//   }
// }
