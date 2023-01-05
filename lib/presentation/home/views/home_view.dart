import 'package:class_link/global/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../services/analytics/analytics_service.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/models/user_type.dart';
import '../../../services/auth/repository/auth_service_repo.dart';
import '../../../services/hive/models/user_info.dart';
import '../../../services/hive/repository/hive_database.dart';
import '../controllers/home_controller.dart';
import 'components/parallex_page_view.dart';
import 'page/non_kiitian_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body:
            Get.find<AuthService>().authDatasources.userType() == UserType.user
                ? batchViseTimetable
                : const NonKiitianView(),
        bottomNavigationBar:
            Get.find<AuthService>().authDatasources.userType() == UserType.user
                ? bottomNavigationBar
                : nonKiitianLogout,
      );

  Widget get bottomNavigationBar => Obx(
        () => BottomNavigationBar(
          currentIndex: controller.resourcesPage.value ? 1 : 0,
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.table, size: 20),
                label: "TimeTable"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.book, size: 20),
                label: "Resources"),
          ],
          onTap: (index) {
            controller.pageController.animateToPage(index,
                duration: 400.milliseconds, curve: Curves.easeInOut);
            controller.resourcesPage.value = index == 1 ? true : false;
          },
        ),
      );

  Widget get nonKiitianLogout => Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Get.isDarkMode ? Colors.red : Colors.white,
              backgroundColor: Get.isDarkMode
                  ? Get.theme.cardColor
                      .alphaBlendColor(
                          Get.theme.scaffoldBackgroundColor, Colors.red[100])
                      .withOpacity(.8)
                  : Colors.red),
          onPressed: () async =>
              Get.find<AuthService>().logout.then((value) async {
                await Get.find<HiveDatabase>().userBoxDatasources.clearUserInfo;
                Get.offAllNamed(Routes.AUTH);
              }),
          child: const Text("Logout")));

  FutureBuilder<UserInfo?> get batchViseTimetable => FutureBuilder<UserInfo?>(
        future: controller.getUserInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            // App open log for google analytics
            Get.find<AnalysisService>().appOpenLogEvent;

            return ParallexPageView(controller: controller);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Material(child: Center(child: Text('Loading...')));
          }
        },
      );
}
