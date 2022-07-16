import 'dart:collection';

import 'package:animations/animations.dart';

import '../../../models/user_info/user_info.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import '../../../services/hive/hive_database.dart';
import '../../../utils/utils.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);

  UserInfo? get userInfo => Get.find<HiveDatabase>().userInfo;

  @override
  Widget build(BuildContext context) {
    final firestoreService = Get.find<FirestoreService>();
    return Scaffold(
      appBar: appBar(context),
      body: streamUserList(firestoreService),
    );
  }

  Widget streamUserList(FirestoreService firestoreService) =>
      StreamBuilder<List<UserInfo>>(
        stream: userInfo?.role == "admin"
            ? firestoreService.userInfoDatasources.streamAllUserList
            : firestoreService.userInfoDatasources.streamUserList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Obx(() => RawScrollbar(
                  thickness: 12,
                  thumbColor: Theme.of(context).colorScheme.primaryContainer,
                  radius: const Radius.circular(6),
                  minThumbLength: 100,
                  interactive: true,
                  child: userListWidget(
                      controller.userList(snapshot.data ?? []),
                      firestoreService),
                ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );

  Widget userListWidget(
      List<UserInfo> userList, FirestoreService firestoreService) {
    return ListView.builder(
      itemCount: userList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ExpansionTile(
        key: PageStorageKey(userList[index].id),
        title: Text(
          userList[index].userName == "" ? "Name" : userList[index].userName,
        ),
        subtitle: Text(userList[index].id),
        children: [
          ListTile(
            title: const Text("Year"),
            trailing: Text(
              userList[index].year.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ListTile(
              title: const Text("Stream"),
              trailing: Text(
                userList[index].stream,
                style: Theme.of(context).textTheme.headline4,
              )),
          ListTile(
              title: const Text("Scheme/Slot"),
              trailing: Text(
                userList[index].slot.toString(),
                style: Theme.of(context).textTheme.headline4,
              )),
          ListTile(
            title: const Text("Batch"),
            trailing: Text(
              userList[index].batch,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ListTile(
            title: const Text("Joined"),
            subtitle: Text(
              Utils.formateDate(userList[index].date, false, true),
              style:
                  Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20),
            ),
          ),
          ListTile(
            title: const Text("Role"),
            subtitle: Text(
              userList[index].role,
              style:
                  Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20),
            ),
            trailing: Wrap(
              children: [
                userList[index].role == "admin"
                    ? const Tooltip(
                        message: "Only owner can change admin role",
                        child: FaIcon(FontAwesomeIcons.shieldAlt),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          final res = await firestoreService.userInfoDatasources
                              .updateUser(userList[index].copyWith(
                                  role: userList[index].role == "user"
                                      ? "viewer"
                                      : "user"));
                          if (res) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Changed to viewer")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Failed to change")));
                          }
                        },
                        child: Text(
                          userList[index].role == "user" ? "Viewer" : "User",
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) => AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          onPressed: () => Get.back(),
        ),
        title: const Text('Admin Page'),
        centerTitle: true,
        actions: [
          userInfo?.role == "admin"
              ? IconButton(
                  onPressed: () async => controller.batch.value =
                      await showBatchList(context, controller.batches),
                  icon: const FaIcon(FontAwesomeIcons.addressBook),
                )
              : const SizedBox.shrink(),
          IconButton(
            onPressed: () => showFilterDialog(context),
            icon: const FaIcon(FontAwesomeIcons.sort),
          ),
        ],
      );

  Future showFilterDialog(BuildContext context) async =>
      await showModal<String>(
        context: context,
        configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: Duration(milliseconds: 300),
        ),
        builder: (BuildContext context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: filterOptions.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  filterOptions[index],
                ),
                onTap: () {
                  controller.updateFilter(filterOptions[index]);
                },
              ),
            ),
          ),
        ),
      );

  Future<String?> showBatchList(
          BuildContext context, LinkedHashMap<String, int> list) async =>
      await showModal<String>(
        context: context,
        configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: Duration(milliseconds: 300),
        ),
        builder: (BuildContext context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final batches = list.keys.toList();
                final count = list.values.toList();
                return ListTile(
                  title: Text(
                    batches[index],
                  ),
                  trailing: Text(count[index].toString()),
                  onTap: () => Get.back<String>(result: batches[index]),
                );
              },
            ),
          ),
        ),
      );
}
