import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart' hide UserInfo;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../global/const/app_info.dart';
import '../../../../global/utils/extension.dart';
import '../../../../global/widget/launcher.dart';
import '../../../../global/widget/user_icon.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../global/widget/theme_selector.dart';
import '../../../services/auth/models/user_type.dart';
import '../../../services/hive/models/user_info.dart';
import '../../test_page/views/test_page.dart';
import '../controllers/profile_controller.dart';
import 'component/app_info_dialog.dart';

const bool testMode = false;

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  User? get user => Get.find<AuthService>().getUser;
  UserInfo? get userInfo =>
      Get.find<HiveDatabase>().userBoxDatasources.userInfo;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(context),
        body: NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              if (notification.metrics.pixels < -120) {
                Get.back();
              }
            }
            return false;
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            physics: const BouncingScrollPhysics(),
            children: [
              profilePhoto,
              const SizedBox(height: 20),
              displayName,
              email,
              const SizedBox(height: 20),
              batch(context),
              holidays,
              const Divider(thickness: 1.5),
              themeSelector,
              themeMode(context),
              blackMode,
              const Divider(thickness: 1.5),
              appUsers,
              // contributer(context),
              controlPanel,
              test,
              logoutCard,
              const SizedBox(height: 20),
              reportProblem,
              const SizedBox(height: 10),
            ],
          ),
        ),
      );

  Widget get reportProblem => SizedBox(
        width: double.maxFinite,
        child: Center(
          child: TextButton(
            onPressed: () => Get.toNamed(Routes.REPORT),
            child: const Text("Report problem"),
          ),
        ),
      );

  Widget contributer(BuildContext context) => ListTile(
        leading: const Icon(FontAwesomeIcons.code),
        onTap: () => showDialog(
          context: context,
          builder: (context) => Theme(
            data: Theme.of(context).copyWith(
                cardColor: Color.alphaBlend(
                    Theme.of(context)
                        .colorScheme
                        .primary
                        .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
                    Theme.of(context).cardColor)),
            child: SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.zero,
              children: [
                dev(context),
                const SizedBox(height: 20),
                ...AppInfo.developer.entries.map((e) => ListTile(
                      onTap: () =>
                          Launcher.launchUrl(context, e.value.split(',').last),
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: e.value.split(',').first,
                            placeholder: (context, url) =>
                                Container(color: Colors.transparent),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      title: Text(e.key.split(',').first),
                      subtitle: Text(e.key.split(',').last),
                    )),
              ],
            ),
          ),
        ),
        title: const Text("Contributer"),
      );

  Widget dev(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => Launcher.launchUrl(
                context, 'https://www.linkedin.com/in/4-alok/'),
            child: CircleAvatar(
              radius: 35,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      "https://avatars.githubusercontent.com/u/29683474?v=4",
                  placeholder: (context, url) =>
                      Container(color: Colors.transparent),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () =>
                Launcher.launchUrl(context, 'https://github.com/4-alok'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Alok Kumar Patel",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
                Text('Lead Developer & Designer',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 15)),
              ],
            ),
          )
        ],
      );

  Widget get logoutCard => ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        tileColor: Get.isDarkMode
            ? Get.theme.cardColor
                .alphaBlendColor(
                    Get.theme.scaffoldBackgroundColor, Colors.red[100])
                .withOpacity(.8)
            : Get.theme.cardColor.alphaBlendColor(Colors.red).withOpacity(.1),
        title: const Row(
          children: [
            Icon(FontAwesomeIcons.rightFromBracket, color: Colors.red),
            SizedBox(width: 10),
            Text('Logout', style: TextStyle(color: Colors.red)),
          ],
        ),
        onTap: () async => await controller.logout(),
      );

  Widget batch(BuildContext context) => Obx(
        () => controller.userType.value == AppUserType.appUser
            ? ListTile(
                leading: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.users),
                  ],
                ),
                title: const Text("My Batch"),
                subtitle: Text(
                  Get.find<HiveDatabase>().userBoxDatasources.userInfo?.batch ??
                      "",
                ),
                onTap: () => Get.toNamed(Routes.MY_BATCH),
              )
            : const SizedBox(),
      );

  Text get email => Text(
        user?.email ?? "",
        textAlign: TextAlign.center,
        style: Get.theme.textTheme.titleMedium!.copyWith(
            fontSize: 18,
            color: Get.theme.primaryColor.alphaBlendColor(
              Get.theme.textTheme.titleMedium!.color!.withOpacity(.5),
            )),
      );

  Text get displayName => Text(
        user?.displayName ?? "",
        textAlign: TextAlign.center,
        style: Get.theme.textTheme.displayLarge!.copyWith(fontSize: 30),
      );

  Hero get profilePhoto => const Hero(
        tag: "profile_image",
        child: UserIcon(radius: 50),
      );

  AppBar appBar(context) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Hero(
          tag: "back",
          child: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Share.share(
                    'Download Class Link form Google Play Store ${AppInfo.appUrl}',
                    subject: 'Class Link',
                  ),
              icon: const FaIcon(FontAwesomeIcons.shareNodes)),
          IconButton(
              // onPressed: () => AppInfoBox.showAppAboutDialog(context),
              onPressed: () => controller.getAppVersion.then(
                  (value) => AppInfoBox.showAppAboutDialog(context, value)),
              icon: const FaIcon(FontAwesomeIcons.info)),
        ],
      );

  Widget get blackMode => AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Get.isDarkMode
            ? Obx(
                () => SwitchListTile(
                  title: const Text('Black Mode'),
                  onChanged: controller.blackModeOnChange,
                  value: controller.isBlack,
                ),
              )
            : const SizedBox(),
      );

  Widget themeMode(BuildContext context) => Theme(
        data: Theme.of(context),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Get.theme.brightness == Brightness.dark
                  ? const FaIcon(FontAwesomeIcons.moon)
                  : const FaIcon(FontAwesomeIcons.sun),
            ],
          ),
          title: const Text("Theme Mode"),
          subtitle: Text(Get.isDarkMode ? "Dark Mode" : "Light Mode"),
          onTap: () => controller.toggleThemeMode(),
        ),
      );

  Widget get holidays => ListTile(
        leading: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.calendarXmark),
          ],
        ),
        title: const Text("Holidays"),
        trailing: const FaIcon(FontAwesomeIcons.caretRight),
        onTap: () => Get.toNamed(Routes.HOLIDAYS),
      );

  Widget get events => Card(
        child: ListTile(
          title: const Text("Events"),
          trailing: const FaIcon(FontAwesomeIcons.caretRight),
          onTap: () => Get.toNamed(Routes.EVENTS),
        ),
      );

  Widget get test => userInfo?.role == "admin" || testMode
      ? ListTile(
          title: const Text("Testing"),
          onTap: () => Get.to(const TestPage()),
        )
      : const SizedBox();

  Widget get showLog => Card(
        child: ListTile(
          title: const Text("Show Log"),
          trailing: const FaIcon(FontAwesomeIcons.caretRight),
          onTap: () => Get.toNamed(Routes.LOG_PAGE),
        ),
      );

  Widget get appUsers => Obx(
        () => controller.userType.value == AppUserType.appUser
            ? ListTile(
                leading: const FaIcon(FontAwesomeIcons.addressBook),
                title: const Text("App Users"),
                onTap: () => Get.toNamed(Routes.ADMIN),
              )
            : const SizedBox(),
      );

  Widget get controlPanel => userInfo?.role == "admin" ||
          testMode ||
          controller.email == "2005847@kiit.ac.in"
      ? ListTile(
          title: const Text("Control Panel"),
          trailing: const FaIcon(FontAwesomeIcons.caretRight),
          onTap: () => Get.toNamed(Routes.CONTROL_PANEL),
        )
      : const SizedBox();

  Widget get themeSelector => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: ListTile(
          title: const Text("Theme"),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ThemeSelector(
              controller: controller.scrollController,
            ),
          ),
        ),
      );
}
