import 'package:class_link/app/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
      contentPadding: const EdgeInsets.all(2),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              "Light",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            onTap: () => Get.changeTheme(ThemeClass.buildTheme(context)),
          ),
          ListTile(
            title: Text(
              "Dark",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            onTap: () {
              Get.changeTheme(ThemeClass.darkTheme);
            },
          ),
          ListTile(
            title: Text(
              "Red",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            onTap: () => Get.changeTheme(ThemeClass.redLightTheme),
            // onTap: () {},
          ),
        ],
      ));
}
