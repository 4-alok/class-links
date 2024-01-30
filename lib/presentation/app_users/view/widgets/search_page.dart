import '../../controller/app_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'user_details_tile.dart';

class SearchPage extends StatelessWidget {
  final AppUsersController controller;

  const SearchPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
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
              onPressed: () => controller.searchController.xmarkPressed(),
            ),
            const SizedBox(width: 10)
          ],
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.searchController.searchList.length,
            itemBuilder: (context, index) {
              final user = controller.searchController.searchList[index];
              return UserDetailsTile(user);
            },
          ),
        ),
      );
}
