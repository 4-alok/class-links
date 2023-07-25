import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/gsheet/datasources/resources_datasources.dart';
import '../../../../services/gsheet/repository/gsheet_service.dart';
import '../widget/common_widget.dart';

class ResourcesTest extends StatefulWidget {
  const ResourcesTest({super.key});

  @override
  State<ResourcesTest> createState() => _ResourcesTestState();
}

class _ResourcesTestState extends State<ResourcesTest> with TestWidget {
  GSheetService get gs => Get.find<GSheetService>();

  ResourcesDatasources get rds => gs.resourcesDatasources;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          testCard(
            testTitle: "Resources Test",
            child: Wrap(
              spacing: 5,
              children: [
                // Load Spreadsheet
                ElevatedButton(
                  onPressed: () async => await gs.loadSpreadSheet.then(
                    (value) => print("Sheet Loaded"),
                  ),
                  child: const Text("Load Spreadsheet"),
                ),

                // Get Resources List
                ElevatedButton(
                  onPressed: () async {
                    // //get all resources data test
                    // final res = await rds.getData;
                    // print(res.rowList);
                  },
                  child: const Text("Test Resources"),
                ),
              ],
            ),
          )
        ],
      );
}
