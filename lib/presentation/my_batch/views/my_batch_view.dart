import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../services/hive/models/user_info.dart';
import '../controllers/my_batch_controller.dart';

final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(0));

class MyBatchView extends GetView<MyBatchController> {
  const MyBatchView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.hiveDatabase.userBoxDatasources.userInfo.value?.batch ??
                "",
            style: Get.textTheme.headlineMedium,
          ),
          centerTitle: true,
          leading: Hero(
            tag: 'back',
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowLeft),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        body: listWithEmail,
      );

  Widget get listWithEmail => FutureBuilder<UserInfoList?>(
        future: controller.getUserInfoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            if (snapshot.data?.list.isEmpty ?? true) {
              return const Center(child: Text("No Data"));
            } else {
              final users = snapshot.data?.list ?? [];
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemCount: users.length,
                itemBuilder: (context, index) =>
                    tileWithName(users, index, context),
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return Container();
        },
      );

  Widget tileWithName(List<UserInfo> users, int index, BuildContext context) =>
      Tooltip(
        message: users[index].id,
        child: Card(
          shape: shape,
          elevation: controller.isMe(users[index].userName) ? 5 : 0,
          child: ListTile(
            shape: shape,
            tileColor: controller.isMe(users[index].userName)
                ? Color.alphaBlend(
                    Theme.of(context)
                        .colorScheme
                        .primary
                        .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
                    Theme.of(context).cardColor,
                  )
                : null,
            leading: Text((index + 1).toString()),
            title: Text(users[index].userName),
            trailing: controller.isMe(users[index].userName)
                ? const Text("😋")
                : null,
          ),
        ),
      );
}
