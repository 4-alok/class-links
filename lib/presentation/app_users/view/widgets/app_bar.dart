// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/app_user_controller.dart';

class AppUserAppBar {
  final AppUsersController controller;
  const AppUserAppBar({required this.controller});

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
                  // Get.find<HiveDatabase>().userBoxDatasources.userInfo.value?.role ==
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
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: SizedBox(
                    height: 50,
                    child: Obx(
                      () => ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        scrollDirection: Axis.horizontal,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  controller.selectedSemester.value == null
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(.2),
                            ),
                            onPressed: () {
                              controller.selectedBatch.value = null;
                              controller.selectedSemester.value = null;
                            },
                            child: Text(
                              "All",
                              style: TextStyle(
                                color: controller.selectedSemester.value == null
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          ...List.generate(
                            4,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      controller.selectedSemester.value ==
                                              index + 1
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(.2),
                                ),
                                onPressed: () {
                                  controller.selectedBatch.value = null;
                                  controller.selectedSemester.value = index + 1;
                                },
                                child: Text("${index + 1} Semester",
                                    style: TextStyle(
                                      color:
                                          controller.selectedSemester.value ==
                                                  index + 1
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary
                                              : null,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      );
}
