import 'package:flutter/material.dart';

import '../../controller/database_utils.dart';
import '../widget/common_widget.dart';

class DatabaseUtils extends StatefulWidget {
  const DatabaseUtils({Key? key}) : super(key: key);

  @override
  State<DatabaseUtils> createState() => _DatabaseUtilsState();
}

class _DatabaseUtilsState extends State<DatabaseUtils> with TestWidget {
  final controller = DatabaseUtilsController();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          testCard(
            testTitle: "Database Utils",
            child: Wrap(
              spacing: 5,
              children: [
                ElevatedButton(
                  onPressed: () => controller.deleteMeFromFirestore,
                  child: const Text("Delete me from firestore"),
                ),
                ElevatedButton(
                  onPressed: () => controller.test(),
                  child: const Text("print build number"),
                ),
                ElevatedButton(
                  onPressed: () => controller.test2(),
                  child: const Text("Set Build Number"),
                ),
                ElevatedButton(
                  onPressed: () => controller.test3(),
                  child: const Text("Clear Build Number"),
                ),
                ElevatedButton(
                  onPressed: () => controller.test4(),
                  child: const Text("Is Lateral"),
                ),
                ElevatedButton(
                  onPressed: () => controller.test5(),
                  child: const Text("Test 5"),
                ),
                ElevatedButton(
                  onPressed: () => controller.test6(),
                  child: const Text("Test 6"),
                ),
              ],
            ),
          ),
        ],
      );
}
