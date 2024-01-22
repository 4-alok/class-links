import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/database_utils.dart';
import '../widget/test_widgets.dart';

class DatabaseUtils extends StatefulWidget {
  const DatabaseUtils({Key? key}) : super(key: key);

  @override
  State<DatabaseUtils> createState() => _DatabaseUtilsState();
}

class _DatabaseUtilsState extends State<DatabaseUtils> with TestWidgets {
  final controller = DatabaseUtilsController();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          testCard(
            testTitle: "Database Utils",
            child: Wrap(
              spacing: 5,
              children: [
                logs(),
                ElevatedButton(
                  onPressed: () => controller.clearUserInfo(),
                  child: const Text("Clear"),
                ),
                ElevatedButton(
                  onPressed: () => controller.fetchUserInfo(),
                  child: const Text("Fetch UserInfo Firestore"),
                ),
                ElevatedButton(
                  onPressed: () => controller.fetchHUserInfo(),
                  child: const Text("Fetch UserInfo Hive"),
                ),
                ElevatedButton(
                  onPressed: () => controller.saveUserInfo(),
                  child: const Text("Save UserInfo Hive"),
                ),
                ElevatedButton(
                  onPressed: () => controller.clearCache(),
                  child: const Text("Clear cache"),
                ),
                ElevatedButton(
                  onPressed: () => controller.ui(),
                  child: const Text("User instance"),
                ),
                ElevatedButton(
                  onPressed: () => controller.updateUserInfoInCache(),
                  child: const Text("Update User info in cache"),
                ),
                const Divider(),
                timetableLog(),
                ElevatedButton(
                  onPressed: () => controller.streamTimetable(),
                  child: const Text("Start Streaming"),
                ),
                ElevatedButton(
                  onPressed: () => controller.timeTableText.value = "",
                  child: const Text("Clear text"),
                ),
                ElevatedButton(
                  onPressed: () => controller.cacheExpiryTime(),
                  child: const Text("Expiry time"),
                ),
                ElevatedButton(
                  onPressed: () => controller.deleteTimetableFromCache(),
                  child: const Text("Delete TimeTable "),
                ),
                ElevatedButton(
                  onPressed: () => controller.clearAllCache(),
                  child: const Text("Clear All Cache"),
                ),
                ElevatedButton(
                  onPressed: () => controller.getIndex(),
                  child: const Text("Get User Index"),
                ),
                ElevatedButton(
                  onPressed: () => controller.addUserInfo(),
                  child: const Text("Add Users"),
                ),
                ElevatedButton(
                  onPressed: () => controller.getUserList(),
                  child: const Text("GetUserList"),
                ),
              ],
            ),
          ),
        ],
      );

  Widget logs() => Obx(
        () => logText([
          Text("UserInfo: ${controller.userInfo.value ?? "No Data"}",
              style: const TextStyle(color: Colors.white)),
        ]),
      );

  Widget timetableLog() => Obx(
        () => logText([
          Text(
            controller.timeTableText.value,
            maxLines: 25,
          ),
        ]),
      );
}
