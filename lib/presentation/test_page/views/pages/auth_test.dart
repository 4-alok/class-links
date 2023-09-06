import 'package:class_link/services/auth/extension/app_user_type.dart';
import 'package:class_link/services/auth/repository/auth_service_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/test_widgets.dart';

class AuthTest extends StatefulWidget {
  const AuthTest({Key? key}) : super(key: key);

  @override
  State<AuthTest> createState() => _SheetTestState();
}

class _SheetTestState extends State<AuthTest> with TestWidgets {
  AuthService get authService => Get.find<AuthService>();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          testCard(
            testTitle: 'Auth Test (Google)',
            child: Wrap(
              spacing: 10,
              children: [
                logs(),
                ElevatedButton(
                  onPressed: () async => await authService.login,
                  child: const Text("Sign-In"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await authService.logout;
                  },
                  child: const Text("Sign-Out"),
                ),
              ],
            ),
          )
        ],
      );

  Widget logs() => Obx(
        () {
          final user = authService.user.value;
          return logText([
            Text("displayName: ${user == null ? "No Data" : user.displayName}",
                style: const TextStyle(color: Colors.white)),
            Text("email: ${user == null ? "No Data" : user.email}",
                style: const TextStyle(color: Colors.white)),

            FutureBuilder(
              future: user.userType,
              builder: (context, snapshot) => Text(
                  "userType: ${snapshot.data ?? "No Data"}",
                  style: const TextStyle(color: Colors.white)),
            ),

            //   Text("userType: ${user == null ? "No Data" : user.userType}",
            //       style: const TextStyle(color: Colors.white)),
          ]);
        },
      );
}
