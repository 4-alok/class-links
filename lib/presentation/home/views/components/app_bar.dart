import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../global/const/const.dart';
import '../../../../../global/widget/app_title.dart';
import '../../../../../global/widget/user_icon.dart';
import '../../../../../routes/app_pages.dart';
import '../../controllers/home_controller.dart';
import 'loading_database_icon.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController homeController;
  const MyAppBar({Key? key, required this.homeController}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height * 2);

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: true,
        leading: const LoadingDatabaseIcon(),
        title: appTitle(context),
        actions: [userIcon(context)],
        bottom: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: tabBar(context),
        ),
        flexibleSpace: Align(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Positioned(
                left: -125,
                top: 0,
                child: SvgPicture.asset(
                  "assets/svg/app_bar_leaf.svg",
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      );

  Widget appTitle(BuildContext context) => Theme(
        data: Theme.of(context),
        child: const Hero(
          tag: "app_logo",
          flightShuttleBuilder: AppTitleWidget.flightShuttleBuilder,
          transitionOnUserGestures: true,
          child: AppTitleWidget(),
        ),
      );

  Widget tabBar(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 8),
        curve: Curves.easeInOut,
        child: TabBar(
          physics: const BouncingScrollPhysics(),
          overlayColor: MaterialStateProperty.resolveWith(_getColor),
          unselectedLabelStyle: const TextStyle(fontSize: 20),
          labelStyle: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 27),
          indicator: UnderlineTabIndicator(
            insets: const EdgeInsets.symmetric(horizontal: 20),
            borderSide: BorderSide(
              width: 2,
              color: Get.isDarkMode
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
          isScrollable: true,
          controller: homeController.tabController,
          tabs: Days.days.map((e) => Tab(text: e)).toList(),
        ),
      );

  Widget userIcon(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: GestureDetector(
          child: const Hero(tag: "profile_image", child: UserIcon(radius: 20)),
          onTap: () => Get.toNamed(Routes.PROFILE),
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
