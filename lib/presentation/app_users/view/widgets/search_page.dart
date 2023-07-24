import 'package:class_link/presentation/app_users/controller/app_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_details_tile.dart';

class SearchPage extends StatelessWidget {
  final AppUsersController controller;

  const SearchPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => Obx(
        () => ListView.builder(
          itemCount: controller.searchController.searchList.length,
          itemBuilder: (context, index) {
            final user = controller.searchController.searchList[index];
            return UserDetailsTile(user);
          },
        ),
      );
}
