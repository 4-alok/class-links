import '../../../global/widget/user_icon.dart';
import '../../../models/user_info/user_info.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';
import '../../../services/hive_database.dart';
import '../../../utils/extension.dart';
import 'package:firebase_auth/firebase_auth.dart' hide UserInfo;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'component/app_info_dialog.dart';
import 'component/appbar_style.dart';
import 'component/theme_selector.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  User? get user => Get.find<AuthService>().user;
  UserInfo? get userInfo => Get.find<HiveDatabase>().userInfo;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(context),
        body: Theme(
          data: Theme.of(context).copyWith(
              cardColor: Color.alphaBlend(
                  Theme.of(context)
                      .colorScheme
                      .primary
                      .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
                  Theme.of(context).cardColor)),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            physics: const BouncingScrollPhysics(),
            children: [
              profilePhoto(),
              const SizedBox(height: 20),
              displayName(),
              email(),
              const SizedBox(height: 20),
              batch(context),
              showLog(),
              const SizedBox(height: 20),
              themeSelector(),
              themeMode(),
              blackMode(),
              const SizedBox(height: 20),
              adminPanel(),
              logoutCard(),
            ],
          ),
        ),
      );

  Card logoutCard() => Card(
        color: Get.isDarkMode
            ? Get.theme.cardColor
                .alphaBlendColor(
                    Get.theme.scaffoldBackgroundColor, Colors.red[100])
                .withOpacity(.8)
            : Get.theme.cardColor.alphaBlendColor(Colors.red).withOpacity(.1),
        child: ListTile(
          title: Row(
            children: const [
              Icon(FontAwesomeIcons.signOutAlt, color: Colors.red),
              SizedBox(width: 10),
              Text('Logout', style: TextStyle(color: Colors.red)),
            ],
          ),
          onTap: () async => await controller.logout(),
        ),
      );

  Card appBarStyle() => Card(
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
      );

  Widget batch(BuildContext context) =>
      Get.find<AuthService>().userType() == UserType.user
          ? Card(
              child: ListTile(
              title: const Text("Batch"),
              trailing: Text(Get.find<HiveDatabase>().userInfo?.batch ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 25)),
            ))
          : const SizedBox();

  Text email() => Text(
        user?.email ?? "",
        textAlign: TextAlign.center,
        style: Get.theme.textTheme.subtitle1!.copyWith(
            fontSize: 18,
            color: Get.theme.primaryColor.alphaBlendColor(
              Get.theme.textTheme.subtitle1!.color!.withOpacity(.5),
            )),
      );

  Text displayName() => Text(
        user?.displayName ?? "",
        textAlign: TextAlign.center,
        style: Get.theme.textTheme.headline1!.copyWith(fontSize: 30),
      );

  Hero profilePhoto() => const Hero(
        tag: "profile_image",
        child: UserIcon(radius: 50),
      );

  AppBar appBar(context) => AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
            ),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
                onPressed: () => AppInfoBox.showAppAboutDialog(context),
                icon: const FaIcon(FontAwesomeIcons.info)),
          ]);

  Widget blackMode() => AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Get.isDarkMode
            ? Card(
                child: Obx(
                  () => SwitchListTile(
                    title: const Text('Black Mode'),
                    onChanged: controller.blackModeOnChange,
                    value: controller.isBlack,
                  ),
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

  Widget showLog() => Get.find<AuthService>().userType() == UserType.user
      ? Card(
          child: ListTile(
            title: const Text("Show Log"),
            trailing: const FaIcon(FontAwesomeIcons.caretRight),
            onTap: () => Get.toNamed(Routes.LOG_PAGE),
          ),
        )
      : const SizedBox();

  Widget adminPanel() => userInfo?.role == "admin"
      ? Card(
          child: ListTile(
            title: const Text("Admin Panel"),
            onTap: () => Get.toNamed(Routes.ADMIN),
          ),
        )
      : const SizedBox();

  Widget themeSelector() => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: ListTile(
            title: const Text("Theme"),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ThemeSelector(
                controller: controller,
              ),
            ),
          ),
        ),
      );
}
