import 'package:class_link/app/modules/home/views/components/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Class Link',
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: UserIcon(radius: 20),
          ),
        ],
      ),
      body: FutureBuilder(
        future: controller.getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return user();
          } else if (snapshot.hasError) {
            return errorPage(snapshot);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
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
