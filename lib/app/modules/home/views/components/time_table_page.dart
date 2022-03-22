import 'package:flutter/material.dart';
import '../../controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'app_bar.dart';
import 'reorderable_list.dart';

class TimeTablePage extends StatelessWidget {
  final HomeController homeController;
  const TimeTablePage({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          if (homeController.editMode.value) {
            homeController.editMode.value = false;
            return false;
          }
          return true;
        },
        child: DefaultTabController(
          length: 7,
          child: Scaffold(
            appBar: MyAppBar(homeController: homeController),
            body: tabBarView,
            floatingActionButton: fab(context),
          ),
        ),
      );

  Widget get tabBarView => ValueListenableBuilder<Object>(
      valueListenable: homeController.hourlyUpdate,
      builder: (_, __, ___) => TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: homeController.tabController,
            children: List.generate(
                7,
                (index) => Obx(
                      () => MyReorderableLIst(
                        homeController: homeController,
                        currentTabIndex: index,
                        currentDay: homeController.week.value[index],
                      ),
                    )),
          ));

  Widget fab(BuildContext context) => Obx(
        () => (homeController.hideEdit.value)
            ? const SizedBox()
            : FloatingActionButton.extended(
                onPressed: homeController.isLoading.value
                    ? null
                    : () async => await toggleEditMode(context),
                icon: Obx(
                  () => homeController.isLoading.value
                      ? const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : !homeController.editMode.value
                          ? const Icon(Icons.edit)
                          : const FaIcon(FontAwesomeIcons.check),
                ),
                label: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: Obx(() => homeController.isLoading.value
                      ? const SizedBox()
                      : !homeController.editMode.value
                          ? const Text("Edit")
                          : const Text("Submit")),
                ),
              ),
      );

  Future<void> toggleEditMode(BuildContext context) async {
    final res = await homeController.toggleEditMode;
    if (res != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res)),
      );
    }
  }
}
