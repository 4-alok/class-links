import 'package:animations/animations.dart';
import 'package:class_link/app/global/const/const.dart';
import 'package:class_link/app/modules/home/views/components/user_profile_dialog.dart';
import 'package:class_link/app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:class_link/app/modules/home/controllers/home_controller.dart';
import 'package:class_link/app/modules/home/views/components/user_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController homeController;
  const MyAppBar({Key? key, required this.homeController}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height * 2);

  @override
  Widget build(BuildContext context) => Obx(
        () => AppBar(
          centerTitle: true,
          leading: homeController.editMode.value
              ? IconButton(
                  onPressed: () => homeController.cancleEditMode(),
                  icon: const FaIcon(FontAwesomeIcons.times),
                )
              : null,
          title: AnimatedCrossFade(
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.easeInOut,
            firstChild: appTitle(context),
            secondChild: editAppTitle(context),
            duration: const Duration(milliseconds: 200),
            crossFadeState: !homeController.editMode.value
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
          actions: homeController.editMode.value ? null : [userIcon(context)],
          bottom: PreferredSize(
            preferredSize: AppBar().preferredSize,
            child: tabBar(context),
          ),
        ),
      );

  Widget editAppTitle(BuildContext context) => const Text(
        'Edit TimeTable',
      );

  Widget appTitle(BuildContext context) => Theme(
        data: Theme.of(context),
        child: Text.rich(
            TextSpan(
              text: 'Class', // default text style
              children: [
                TextSpan(
                  text: ' Link ',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context)
                                .colorScheme
                                .secondaryVariant
                                .value ==
                            Theme.of(context).appBarTheme.backgroundColor!.value
                        ? BlendColor.boldTitle(
                            context, Theme.of(context).colorScheme.primary)
                        : BlendColor.boldTitle(context,
                            Theme.of(context).colorScheme.secondaryVariant),
                  ),
                ),
              ],
            ),
            style: const TextStyle(
              fontSize: 30,
            )),
      );

  Widget tabBar(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 8),
        curve: Curves.easeInOut,
        child: TabBar(
          physics: const BouncingScrollPhysics(),
          overlayColor: MaterialStateProperty.resolveWith(_getColor),
          unselectedLabelStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          labelStyle:
              Theme.of(context).textTheme.headline4!.copyWith(fontSize: 27),
          indicatorColor: Colors.transparent,
          isScrollable: true,
          controller: homeController.tabController,
          tabs: Days.days.map((e) => Tab(text: e)).toList(),
        ),
      );

  Padding userIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        child: const UserIcon(radius: 20),
        onTap: () => showModal<void>(
          context: context,
          configuration: const FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 300),
          ),
          builder: (BuildContext context) => const UserProfileDialog(),
        ),
      ),
    );
  }

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
