import 'package:class_link/global/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../services/auth/repository/auth_service_repo.dart';
import '../../services/hive/repository/hive_database.dart';

class NonKiitianView extends StatelessWidget {
  const NonKiitianView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          height: double.maxFinite,
          margin: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(FontAwesomeIcons.faceDizzy, size: 130),
              SizedBox(height: 80),
              Text(
                "We apologise, this app is not available for you",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Get.isDarkMode ? Colors.red : Colors.white,
                    backgroundColor: Get.isDarkMode
                        ? Get.theme.cardColor
                            .alphaBlendColor(Get.theme.scaffoldBackgroundColor,
                                Colors.red[100])
                            .withOpacity(.8)
                        : Colors.red),
                onPressed: () async =>
                    Get.find<AuthService>().logout.then((value) async {
                      await Get.find<HiveDatabase>()
                          .userBoxDatasources
                          .clearUserInfo;
                      Get.offAllNamed(Routes.AUTH);
                    }),
                child: const Text("Logout"))),
      );
}
