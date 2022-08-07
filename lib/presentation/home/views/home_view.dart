import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/analytics/analytics_service.dart';
import '../../../../services/auth/models/user_type.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../services/hive/models/user_info.dart';
import '../controllers/home_controller.dart';
import 'components/time_table_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Get.find<AuthService>().authDatasources.userType() == UserType.user
          ? batchViseTimetable
          : TimeTablePage(homeController: controller);

  FutureBuilder<UserInfo?> get batchViseTimetable => FutureBuilder<UserInfo?>(
        future: controller.getUserInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            // App open log for google analytics
            Get.find<AnalysisService>().appOpenLogEvent;

            return TimeTablePage(homeController: controller);
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
