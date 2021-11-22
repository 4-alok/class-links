import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:class_link/app/modules/user_info/controllers/user_info_controller.dart';

class CustomAppBar extends StatelessWidget {
  final UserInfoController controller;
  const CustomAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: true,
      title: Obx(
        () => Text(
          controller.appBarTitleList[controller.currentPage.value],
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
