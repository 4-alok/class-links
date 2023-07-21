import 'dart:collection';

import 'package:animations/animations.dart';
import 'package:class_link/services/hive/models/user_info.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../global/utils/utils.dart';
import '../controller/app_user_controller.dart';

class AppUserView extends GetView<AppUsersController> {
  const AppUserView({Key? key}) : super(key: key);

  RoundedRectangleBorder get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: "back",
          child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowLeft),
              onPressed: () => Get.back()),
        ),
        actions: [
          Get.find<HiveDatabase>().userBoxDatasources.userInfo?.role == "admin"
              ? IconButton(
                  icon: const FaIcon(FontAwesomeIcons.arrowsRotate),
                  onPressed: () => controller.syncGSheetUsers,
                )
              : const SizedBox(),
        ],
        centerTitle: true,
        title: const Text('App Users'),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              progressIndicator(),
              userCountCard(context),
              userListCard(context),
            ],
          )));

  Widget progressIndicator() => Obx(() => AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: controller.loading.value
            ? const LinearProgressIndicator()
            : const SizedBox(),
      ));

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
                  title: Text(batches[index]),
                  trailing: Text(count[index].toString()),
                  onTap: () => Get.back<String>(result: batches[index]),
                );
              },
            ),
          ),
        ),
      );

  Future<void> showFilterDialog(BuildContext context) async =>
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

  Widget userCountCard(BuildContext context) => Card(
        shape: shape,
        elevation: 5,
        child: Obx(
          () => ExpansionTile(
            title: Text("Year",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 25)),
            leading: Obx(
              () => Text("${controller.selectedYear.value ?? "All"}",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 25)),
            ),
            trailing: TextButton(
              onPressed: () => controller.selectedYear.value = null,
              child: const Text("Show All"),
            ),
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () => controller.selectedYear.value = 1,
                title: Text("1st Year",
                    style: Theme.of(context).textTheme.titleLarge),
                trailing: Text(controller.yearWiseUserCount[0].toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () => controller.selectedYear.value = 2,
                title: Text("2nd Year",
                    style: Theme.of(context).textTheme.titleLarge),
                trailing: Text(controller.yearWiseUserCount[1].toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () => controller.selectedYear.value = 3,
                title: Text("3rd Year",
                    style: Theme.of(context).textTheme.titleLarge),
                trailing: Text(controller.yearWiseUserCount[2].toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
            ],
          ),
        ),
      );

  Widget userListCard(BuildContext context) {
    return GetBuilder<AppUsersController>(
      builder: (_) {
        final users = controller.getUserList;
        return Card(
          shape: shape,
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Text(controller.selectedBatch.value ?? "All Batches",
                      style: Theme.of(context).textTheme.headlineMedium),
                  const Spacer(),
                  controller.selectedBatch.value != null
                      ? IconButton(
                          onPressed: () =>
                              controller.selectedBatch.value = null,
                          icon:
                              const FaIcon(FontAwesomeIcons.filterCircleXmark))
                      : IconButton(
                          onPressed: () async =>
                              controller.selectedBatch.value =
                                  await showBatchList(
                                      context, controller.batchList(users)),
                          icon: const FaIcon(FontAwesomeIcons.filter),
                        ),
                  IconButton(
                    onPressed: () => showFilterDialog(context),
                    icon: const FaIcon(FontAwesomeIcons.sort),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const Divider(),
              SizedBox(
                width: double.maxFinite,
                height: 600,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) =>
                      userDetailsTile(users[index], context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget userDetailsTile(UserInfo user, BuildContext context) => ExpansionTile(
        key: PageStorageKey(user.id),
        title: Text(
          user.userName == "" ? "Name" : user.userName,
        ),
        subtitle: Text(user.id),
        children: [
          ListTile(
            title: const Text("Year"),
            trailing: Text(
              user.year.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ListTile(
              title: const Text("Stream"),
              trailing: Text(
                user.stream,
                style: Theme.of(context).textTheme.headlineMedium,
              )),
          ListTile(
              title: const Text("Scheme/Slot"),
              trailing: Text(
                user.slot.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              )),
          ListTile(
            title: const Text("Batch"),
            trailing: Text(
              user.batch,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ListTile(
            title: const Text("Joined"),
            subtitle: Text(
              Utils.formateDate(user.date, false, true),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
          user.role == "admin" || user.role == "mod"
              ? ListTile(
                  title: const Text("Role"),
                  subtitle: Text(
                    user.role,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 20),
                  ),
                  trailing: Wrap(
                    children: [
                      user.role == "admin"
                          ? const Tooltip(
                              message: "Only owner can change admin role",
                              child: FaIcon(FontAwesomeIcons.shieldHalved),
                            )
                          : ElevatedButton(
                              onPressed: () async {},
                              child: Text(
                                user.role == "user" ? "Viewer" : "User",
                              ),
                            ),
                    ],
                  ),
                )
              : const SizedBox()
        ],
      );
}
