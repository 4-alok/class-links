import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/gsheet/repository/gsheet_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../controller/database_utils.dart';
import '../widget/common_widget.dart';

class SheetTest extends StatefulWidget {
  const SheetTest({Key? key}) : super(key: key);

  @override
  State<SheetTest> createState() => _SheetTestState();
}

class _SheetTestState extends State<SheetTest> with TestWidget {
  GSheetService get gsheetService => Get.find<GSheetService>();
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  FirestoreService get firestoreService => Get.find<FirestoreService>();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          // testCard(
          //   testTitle: "Gsheet Test",
          //   child: Wrap(
          //     spacing: 5,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () =>
          //             gsheetService.gSheetUserInfoDatasources.addUserInfo(
          //           hiveDatabase.userBoxDatasources.userInfo!,
          //         ),
          //         child: const Text("Add User Test"),
          //       ),
          //       ElevatedButton(
          //         onPressed: () async {
          //           final users = await gsheetService
          //               .gSheetUserInfoDatasources.getAllUserList;
          //           for (var k in users) {
          //             log(k.toString());
          //           }
          //         },
          //         child: const Text("Get All User Test"),
          //       ),
          //       ElevatedButton(
          //         onPressed: () async =>
          //             gsheetService.sheetTimetableDatasources.getTimetableData,
          //         child: const Text("Test Timetable List"),
          //       ),
          //       ElevatedButton(
          //         onPressed: () async =>
          //             gsheetService.sheetTimetableDatasources.getMyTimetable,
          //         child: const Text("Test My Timetable"),
          //       ),
          //       ElevatedButton(
          //         onPressed: () async => {},
          //         child: const Text("Test Row List Json"),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 10),
          testCard(
            testTitle: 'Elective',
            child: Wrap(
              children: [
                ElevatedButton(
                  onPressed: () => DatabaseUtilsController().deleteUserWhereRollNoStartWith22(),
                  child: const Text("Delete 22*"),
                )
                // ElevatedButton(
                //   onPressed: () {
                //     final k =
                //         gsheetService.teacherInfoDatasource.getMyTeachersCached;
                //   },
                //   child: const Text("Get Teacher Info"),
                // ),
                // ElevatedButton(
                //     onPressed: () async {
                //       final res = await hiveDatabase.cacheBoxDataSources
                //           .getRequest('teachers');
                //       print(res);
                //     },
                //     child: const Text("Check Box")),
                // ElevatedButton(
                //     onPressed: () async {
                //       final k = await gsheetService
                //           .teacherInfoDatasource.getMyTeachersCached;
                //       print(k);
                //     },
                //     child: const Text("Get MyTeacherCached")),
                // const SizedBox(height: 10),
                // ElevatedButton(
                //   onPressed: () async {
                //     final res = await Get.find<FirestoreService>()
                //         .electiveDatasources
                //         .getUserElectiveSectoin(2005847);
                //     print(res);
                //   },
                //   child: const Text("Get User Elective Section"),
                // ),
                // ElevatedButton(
                //     onPressed: () {
                //       firestoreService.electiveDatasources.getElectiveTimeTable;
                //     },
                //     child: const Text(
                //       "Get my elective table",
                //     ))
              ],
            ),
          )
        ],
      );
}
