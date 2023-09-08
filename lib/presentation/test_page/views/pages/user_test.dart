import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/gsheet/repository/gsheet_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../widget/test_widgets.dart';

class UserTestPage extends StatefulWidget {
  const UserTestPage({Key? key}) : super(key: key);

  @override
  State<UserTestPage> createState() => _SheetTestState();
}

class _SheetTestState extends State<UserTestPage> with TestWidgets {
  GSheetService get gsheetService => Get.find<GSheetService>();
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  FirestoreService get firestoreService => Get.find<FirestoreService>();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          testCard(
            testTitle: 'User Test',
            child: Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // DatabaseUtilsController()
                    //     .deleteUserWhereRollNoStartWith22();
                  },
                  child: const Text("Is user exist"),
                ),
              ],
            ),
          )
        ],
      );

  // Widget logText() => Container(
  //       margin: const EdgeInsets.only(bottom: 10),
  //       decoration: BoxDecoration(
  //           color: Colors.black, borderRadius: BorderRadius.circular(10)),
  //       width: double.maxFinite,
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             // Obx(
  //             //   () => Text(
  //             //       "userInfo : ${hiveDatabase.userBoxDatasources.userInfo.value ? "No Data" : controller.isEmpty.value! ? "Empty" : "Not Empty"}",
  //             //       style: const TextStyle(color: Colors.white)),
  //             // ),
  //           ],
  //         ),
  //       ),
  //     );
}
