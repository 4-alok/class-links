import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';
import 'components/theme_dialog.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Card(
              color: Colors.grey[100],
              child: ListTile(
                title: const Text("Theme"),
                subtitle: const Text("Light Theme"),
                onTap: () {
                  showModal<void>(
                    context: context,
                    configuration: const FadeScaleTransitionConfiguration(
                      transitionDuration: Duration(milliseconds: 300),
                    ),
                    builder: (BuildContext context) => const ThemeDialog(),
                  );
                },
              ),
            ),
            Card(
              color: Colors.grey[100],
              child: ListTile(
                title: const Text("Toogle Theme"),
                subtitle: const Text(""),
                onTap: () {
                  Get.changeThemeMode(
                      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  // Get.changeTheme(ThemeClass.lightTheme);
                },
              ),
            )
          ],
        ));
  }
}
