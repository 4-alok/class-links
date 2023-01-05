import 'package:class_link/presentation/home/views/components/time_table_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/auth/models/user_type.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../resources/controller/resources_controller.dart';
import '../../../resources/view/resources_view.dart';
import '../../controllers/home_controller.dart';

class ParallexPageView extends StatefulWidget {
  final HomeController controller;
  const ParallexPageView({Key? key, required this.controller}) : super(key: key);

  @override
  State<ParallexPageView> createState() => _ParallexPageViewState();
}

class _ParallexPageViewState extends State<ParallexPageView> {
  @override
  void initState() {
    Get.put<ResourcesController>(ResourcesController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ResourcesController>();
    super.dispose();
  }

  UserType get userType => Get.find<AuthService>().authDatasources.userType();

  @override
  Widget build(BuildContext context) => PageView(
        controller: widget.controller.pageController,
        onPageChanged: (value) =>
            widget.controller.resourcesPage.value = value == 1 ? true : false,
        children: [
          TimeTablePage(homeController: widget.controller),
          const ResourcesView(),
        ],
      );
}
