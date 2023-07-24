// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/app_user_controller.dart';

class AppUserAppBar {
  final AppUsersController controller;
  AppUserAppBar({required this.controller});

  Widget build(BuildContext context) => Obx(
        () => controller.searchController.searchPage.value
            ? AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: TextField(
                  controller: controller.searchController.searchTextController,
                  autofocus: true,
                  onChanged: controller.searchController.updateList,
                  decoration: const InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.xmark),
                    onPressed: () =>
                        controller.searchController.searchPage.value = false,
                  ),
                  const SizedBox(width: 10)
                ],
              )
            : AppBar(
                leading: Hero(
                  tag: "back",
                  child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                      onPressed: () => Get.back()),
                ),
                actions: [
                  // Get.find<HiveDatabase>().userBoxDatasources.userInfo?.role ==
                  //             "admin" ||
                  //         Get.find<AuthService>().user.value?.email ==
                  //             "2005847@kiit.ac.in"
                  //     ? IconButton(
                  //         icon: const FaIcon(FontAwesomeIcons.arrowsRotate),
                  //         onPressed: () => controller.syncGSheetUsers,
                  //       )
                  //     : const SizedBox(),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.search),
                    onPressed: () =>
                        controller.searchController.searchPage.value = true,
                  ),
                  const SizedBox(width: 10)
                ],
                centerTitle: true,
                title: const Text('App Users'),
              ),
      );
}
