import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'components/time_table_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserInfo?>(
      future: controller.getUserInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
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
}
