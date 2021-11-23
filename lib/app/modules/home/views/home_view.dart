import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'components/time_table.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserInfo?>(
      future: controller.getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return TimeTablePage(homeController: controller);
        } else if (snapshot.hasError) {
          return errorPage(snapshot);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: Text('Error'));
        }
      },
    );
  }

  Widget errorPage(AsyncSnapshot<Object?> snapshot) {
    return Column(
      children: [
        Text(snapshot.error.toString()),
      ],
    );
  }

  ListView user() {
    print(controller.userInfo);
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Text(controller.userInfo!.id),
            subtitle: Text(controller.userInfo!.batch),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
