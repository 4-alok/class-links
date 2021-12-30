import 'package:class_link/app/services/local_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';
import 'components/appbar_style.dart';
import 'components/theme_selector.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  int get blendFactor => Get.isDarkMode ? 4 : 3;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: appBar(),
        body: Theme(
          data: theme.copyWith(
            cardColor: Color.alphaBlend(
                theme.colorScheme.primary.withAlpha(5 * blendFactor),
                theme.cardColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                themeSelector(),
                themeMode(),
                blackMode(),
                Card(
                  child: Obx(
                    () {
                      final appBarStyle = Get.find<HiveDatabase>().appbarStyle;
                      return ListTile(
                        title: const Text("AppBar Style"),
                        trailing: AppBarStyleButtons(
                          style: appBarStyle.value,
                          onChanged: (val) => appBarStyle.value = val,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget blackMode() => AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Get.isDarkMode
            ? Card(
                child: Obx(
                  () {
                    final isBlack = Get.find<HiveDatabase>().isBlack;
                    return SwitchListTile(
                      title: const Text(
                        'Black Mode',
                      ),
                      onChanged: (bool value) {
                        isBlack.value = !isBlack.value;
                      },
                      value: isBlack.value,
                    );
                  },
                ),
              )
            : const SizedBox(),
      );

  Widget themeMode() => Card(
        child: ListTile(
          title: const Text("Theme Mode"),
          subtitle: Text(Get.isDarkMode ? "Dark Mode" : "Light Mode"),
          onTap: () => controller.toogleThemeMode(),
        ),
      );

  Widget themeSelector() => const Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: ListTile(
            title: Text(
              "Theme",
              // style: ,
            ),
            subtitle: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ThemeSelector(),
            ),
          ),
        ),
      );

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.arrowLeft,
        ),
        onPressed: () => Get.back(),
      ),
      title: const Text(
        'Settings',
      ),
      centerTitle: true,
    );
  }
}
