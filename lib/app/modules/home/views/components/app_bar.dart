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
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedCrossFade(
        firstCurve: Curves.easeInOut,
        secondCurve: Curves.easeInOut,
        firstChild: _appBar(context),
        secondChild: _appBarEditMode(context),
        duration: Duration(milliseconds: 200),
        crossFadeState: !homeController.editMode.value
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }

  Widget _appBarEditMode(BuildContext context) {
    return AppBar(
      centerTitle: true,
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
            icon: Icon(Icons.sync, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
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
            child: GestureDetector(child: UserIcon(radius: 20),onTap:() {
              // TODO:Adding a Profile page
              
            },),

          ),
      ],
    );
  }
}
