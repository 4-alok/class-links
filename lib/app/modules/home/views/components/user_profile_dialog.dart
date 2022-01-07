// import 'package:class_link/app/modules/home/controllers/home_controller.dart';
// import 'package:class_link/app/global/widget/user_icon.dart';
// import 'package:class_link/app/routes/app_pages.dart';
// import 'package:class_link/app/services/auth_service.dart';
// import 'package:class_link/app/services/local_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UserProfileDialog extends StatelessWidget {
//   const UserProfileDialog({Key? key}) : super(key: key);

//   HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
//   AuthService get authService => Get.find<AuthService>();
//   HomeController get homeController => Get.find<HomeController>();

//   @override
//   Widget build(BuildContext context) => AlertDialog(
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0))),
//       contentPadding: const EdgeInsets.all(2),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ListTile(
//             leading: const UserIcon(radius: 40),
//             title: Text(authService.user?.displayName ?? '',
//                 style: Theme.of(context).textTheme.headline4!.copyWith(
//                       fontSize: 20,
//                     )),
//             subtitle: Text(
//               hiveDatabase.userInfo?.batch ?? "",
//               style: Theme.of(context).textTheme.subtitle1!.copyWith(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w300,
//                   ),
//             ),
//           ),
//           const Divider(
//             color: Colors.black,
//           ),
//           ListTile(
//             title: Text(
//               "Settings",
//               style: Theme.of(context).textTheme.headline4!.copyWith(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.grey[600]),
//             ),
//             onTap: () {
//               Get.back();
//               Get.toNamed(Routes.SETTINGS);
//             },
//           ),
//           hiveDatabase.userInfo!.role == "admin"
//               ? ListTile(
//                   title: Text("Admin",
//                       style: Theme.of(context).textTheme.headline4!.copyWith(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.grey[600],
//                           )),
//                   onTap: () {
//                     Get.back();
//                     Get.toNamed(Routes.ADMIN);
//                   },
//                 )
//               : const SizedBox(),
//           ListTile(
//             title: Text(
//               "Logout",
//               style: Theme.of(context).textTheme.headline4!.copyWith(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.red[300]),
//             ),
//             onTap: () async => await homeController.logout(),
//           ),
//         ],
//       ));
// }