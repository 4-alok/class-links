import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../models/user_info/user_info.dart';
import '../../../services/firebase/firestore_service.dart';
import '../../../services/hive/hive_database.dart';
import '../controllers/my_batch_controller.dart';

class MyBatchView extends GetView<MyBatchController> {
  const MyBatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(
          Get.find<HiveDatabase>().userInfo?.batch ?? "",
          style: Get.textTheme.headline4,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: FutureBuilder<List<UserInfo>>(
        future: Get.find<FirestoreService>().myBatch,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            if (snapshot.data?.isEmpty ?? true) {
              return const Center(child: Text("No Data"));
            } else {
              final users = snapshot.data ?? [];
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(users[index].userName),
                  subtitle: Text(
                    users[index].id,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          }
          return Container();
        },
      ));
}
