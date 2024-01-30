import '../model/background_parameter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../services/hive/models/user_info.dart';
import '../../resources/view/resources_view.dart';
import '../controllers/home_controller.dart';
import 'components/parallex_page_view.dart';
import 'components/time_table_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  !context.isDarkMode ? Brightness.dark : Brightness.light,
              systemNavigationBarColor: Theme.of(context).cardColor,
              statusBarBrightness:
                  !context.isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
        ),
        body: FutureBuilder<UserInfo?>(
          future: controller.getUserInfo,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ParallexPageView(
                backgroundParameter: const Parameter(),
                controller: controller,
                children: [
                  TimeTablePage(homeController: controller),
                  const ResourcesView(),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              ));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Material(
                  child: Center(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('No data: Something went wrong'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: controller.logout,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Text("Logout"),
                    ),
                  ),
                ],
              )));
            }
          },
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.resourcesPage.value ? 1 : 0,
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.table, size: 20),
                  label: "TimeTable"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.book, size: 20),
                  label: "Resources"),
            ],
            onTap: (index) {
              controller.pageController.animateToPage(index,
                  duration: 400.milliseconds, curve: Curves.easeInOut);
              controller.resourcesPage.value = index == 1 ? true : false;
            },
          ),
        ),
      );
}
