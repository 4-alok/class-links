import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/gsheet/repository/gsheet_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../controller/sheet_test_controller.dart';
import '../widget/test_widgets.dart';

class SheetTest extends StatefulWidget {
  const SheetTest({super.key});

  @override
  State<SheetTest> createState() => _SheetTestState();
}

class _SheetTestState extends State<SheetTest> with TestWidgets {
  GSheetService get gsheetService => Get.find<GSheetService>();
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  FirestoreService get firestoreService => Get.find<FirestoreService>();

  final controller = SheetTestController();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          testCard(
            testTitle: "Gsheet Test",
            child: Wrap(
              spacing: 5,
              children: [
                ElevatedButton(
                  onPressed: () => controller.streamTimetable(),
                  // gsheetService.gSheetUserInfoDatasources.addUserInfo(
                  // hiveDatabase.userBoxDatasources.userInfo.value!,

                  child: const Text("Fetch Timetable"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          testCard(
            testTitle: 'Elective',
            child: Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // gsheetService.sheetTimetableDatasources.getData2;
                  },
                  child: const Text("Read 6 sem with new algo"),
                ),
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
                // const SizedBox(width: 10),
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
                //     )),
              ],
            ),
          )
        ],
      );
}
