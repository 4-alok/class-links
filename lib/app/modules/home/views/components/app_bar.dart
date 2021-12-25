import 'package:animations/animations.dart';
import 'package:class_link/app/modules/home/views/components/user_profile_dialog.dart';
import 'package:flutter/material.dart';
import 'package:class_link/app/modules/home/controllers/home_controller.dart';
import 'package:class_link/app/modules/home/views/components/user_icon.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController homeController;
  const MyAppBar({Key? key, required this.homeController}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) => Obx(
        () => AnimatedCrossFade(
          firstCurve: Curves.easeInOut,
          secondCurve: Curves.easeInOut,
          firstChild: _appBar(context),
          secondChild: _appBarEditMode(context),
          duration: const Duration(milliseconds: 200),
          crossFadeState: !homeController.editMode.value
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
      );

  Widget _appBarEditMode(BuildContext context) => AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => homeController.cancleEditMode(),
            icon: const Icon(Icons.cancel_outlined, color: Colors.black87)),
        title: Text(
          'Edit TimeTable',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontSize: 27, color: Colors.black87),
        ),
        backgroundColor: Colors.blue[100],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sync, color: Colors.black87),
            ),
          ),
        ],
      );

  Widget _appBar(BuildContext context) => AppBar(
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Class Link',
          style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 27),
        ),
        backgroundColor: Theme.of(context).cardColor,
        actions: [
          Padding(
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
          ),
        ],
      );
}
