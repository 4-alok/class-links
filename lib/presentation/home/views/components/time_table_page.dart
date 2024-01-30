import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import 'app_bar.dart';
import 'timetable_list_widget.dart';

class TimeTablePage extends StatelessWidget {
  final HomeController homeController;
  const TimeTablePage({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: MyAppBar(homeController: homeController),
          body: tabBarView(context),
        ),
      );

  Widget tabBarView(BuildContext context) => ValueListenableBuilder<int>(
        valueListenable: homeController.hourlyUpdate,
        builder: (_, __, ___) => TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: homeController.tabController,
          children: List.generate(
            7,
            (index) => Obx(
              () => TimetableListWidget(
                homeController: homeController,
                currentTabIndex: index,
                currentDay: homeController.week.value[index],
              ),
            ),
          ),
        ),
      );
}
