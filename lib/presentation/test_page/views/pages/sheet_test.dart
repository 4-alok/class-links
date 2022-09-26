import 'dart:developer';

import 'package:class_link/services/firebase/repository/firestore_service.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/gsheet/repository/gsheet_service.dart';
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
  Widget build(BuildContext context) => testCard(
        testTitle: "Gsheet Test",
        child: Wrap(
          spacing: 5,
          children: [
            ElevatedButton(
              onPressed: () =>
                  gsheetService.gSheetUserInfoDatasources.addUserInfo(
                hiveDatabase.userBoxDatasources.userInfo!,
              ),
              child: const Text("Add User Test"),
            ),
            ElevatedButton(
              onPressed: () async {
                final users = await gsheetService
                    .gSheetUserInfoDatasources.getAllUserList;
                for (var k in users) {
                  log(k.toString());
                }
              },
              child: const Text("Get All User Test"),
            ),
            ElevatedButton(
              onPressed: () async =>
                  gsheetService.sheetTimetableDatasources.getTimetableData,
              child: const Text("Test Timetable"),
            ),
          ],
        ),
      );
}
