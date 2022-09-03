import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../services/hive/models/user_info.dart';
import '../controllers/my_batch_controller.dart';

class MyBatchView extends GetView<MyBatchController> {
  const MyBatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            Get.find<HiveDatabase>().userBoxDatasources.userInfo?.batch ?? "",
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
        body: listWithEmail,
      );

  Widget get listWithEmail => FutureBuilder<List<UserInfo>>(
        future: Get.find<FirestoreService>().userInfoDatasources.myBatch(false),
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
                itemBuilder: (context, index) => controller.is3rdYear
                    ? tileWithName(users, index, context)
                    : tileWithNameAndEmail(users, index, context),
              );
            }
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          }
          return Container();
        },
      );

  Widget tileWithName(List<UserInfo> users, int index, BuildContext context) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: controller.isMe(users[index].userName)
              ? Theme.of(context).primaryColor.withAlpha(80)
              : Color.alphaBlend(
                  Theme.of(context)
                      .colorScheme
                      .primary
                      .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
                  Theme.of(context).cardColor),
          leading: Text((index + 1).toString()),
          title: Text(users[index].userName),
          trailing:
              controller.isMe(users[index].userName) ? const Text("😋") : null,
        ),
      );

  ListTile tileWithNameAndEmail(
          List<UserInfo> users, int index, BuildContext context) =>
      ListTile(
        title: Text(users[index].userName),
        subtitle: Text(
          users[index].id,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      );
}
