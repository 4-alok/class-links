import 'package:class_link/app/global/const/const.dart';
import 'package:flutter/material.dart';
import 'package:class_link/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'app_bar.dart';
import 'reordable_list.dart';

class TimeTablePage extends StatelessWidget {
  final HomeController homeController;
  const TimeTablePage({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: MyAppBar(
            homeController: homeController,
          ),
          body: Column(
            children: [
              tabBar(context),
              tabBarView(),
            ],
          ),
          floatingActionButton: fab(),
        ),
      );

  FloatingActionButton fab() => FloatingActionButton.extended(
        onPressed: () => homeController.toggleEditMode(),
        icon: Obx(() => !homeController.editMode.value
            ? const Icon(Icons.edit)
            : const Icon(Icons.done)),
        label: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: Obx(() =>
              !homeController.editMode.value ? const Text("Edit") : const Text("Submit")),
        ),
      );

  Widget tabBarView() => Expanded(
        child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: homeController.tabController,
          children: List.generate(
              7,
              (index) => Obx(
                    () => MyReordableLIst(
                      homeController: homeController,
                      currentDay: homeController.week.value[index],
                    ),
                  )),
        ),
      );

  Widget tabBar(BuildContext context) => Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 8),
          curve: Curves.easeInOut,
          color: !homeController.editMode.value
              ? Theme.of(context).cardColor
              : Colors.blue[100],
          child: TabBar(
            physics: const BouncingScrollPhysics(),
            overlayColor: MaterialStateProperty.resolveWith(_getColor),
            labelColor: Colors.black,
            unselectedLabelStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            labelStyle:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 27),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.transparent,
            isScrollable: true,
            controller: homeController.tabController,
            tabs: Days.days.map((e) => Tab(text: e)).toList(),
          ),
        ),
      );

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) return Colors.transparent;
    return Colors.transparent;
  }
}
