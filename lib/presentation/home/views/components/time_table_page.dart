import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import 'app_bar.dart';
import 'timetable_list_widget.dart';

class TimeTablePage extends StatelessWidget {
  final HomeController homeController;
  const TimeTablePage({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: MyAppBar(homeController: homeController),
          body: tabBarView,
          // bottomNavigationBar: const AdsContainer(),
          // floatingActionButton: fab(context),
        ),
      );

  Widget get tabBarView => ValueListenableBuilder<Object>(
      valueListenable: homeController.hourlyUpdate,
      builder: (_, __, ___) => TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: homeController.tabController,
          children: List.generate(7, (index) {
            switch (index) {
              case 5:
                return Container();
              case 6:
                return Container();
              default:
                return Obx(
                  () => TimetableListWidget(
                    homeController: homeController,
                    currentTabIndex: index,
                    currentDay: homeController.week.value[index],
                  ),
                );
            }
          })));
}
