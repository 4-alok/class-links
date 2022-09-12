import 'package:animations/animations.dart';
import 'package:class_link/presentation/home/views/components/time_table_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/widget/sliding_switch.dart';
import '../../../resources/controller/resources_controller.dart';
import '../../../resources/view/resources_view.dart';
import '../../controllers/home_controller.dart';

class PageSwitcher extends StatefulWidget {
  final HomeController controller;
  const PageSwitcher({Key? key, required this.controller}) : super(key: key);

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  final lib = false.obs;

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

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Obx(
            () => PageTransitionSwitcher(
              reverse: !lib.value,
              transitionBuilder: (Widget child, Animation<double> animation,
                      Animation<double> secondaryAnimation) =>
                  SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                      child: child),
              child: !lib.value
                  ? TimeTablePage(homeController: widget.controller)
                  : const ResourcesView(),
            ),
          ),
          switchWidget,
        ],
      );

  Widget get switchWidget => Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 50,
        child: Center(
          child: SlidingSwitch(
            onChanged: (bool value) => lib.value = value,
          ),
        ),
      ));
}
