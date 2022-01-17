import 'package:class_link/app/gen/assets.gen.dart';
import 'package:class_link/app/global/widget/user_icon.dart';
import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/hive_database.dart';
import 'package:class_link/app/utils/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/profile_controller.dart';
import 'component/appbar_style.dart';
import 'component/theme_selector.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  User? get user => Get.find<AuthService>().user;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(context),
        body: Theme(
          data: Get.theme.copyWith(
              cardColor: Color.alphaBlend(
                  Get.theme.colorScheme.primary
                      .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
                  Get.theme.cardColor)),
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
              // appBarStyle(),
              const SizedBox(height: 20),
              logoutCard(),
            ],
          ),
        ),
      );

  Card logoutCard() => Card(
        color: Get.theme.cardColor
            .alphaBlendColor(
                Get.isDarkMode
                    ? Get.theme.scaffoldBackgroundColor
                    : Colors.red.withOpacity(0.05),
                Colors.red[100])
            .withOpacity(.8),
        child: ListTile(
          title: const Text('Logout', style: TextStyle(color: Colors.red)),
          leading: const Icon(FontAwesomeIcons.signOutAlt, color: Colors.red),
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

  Card batch(BuildContext context) => Card(
          child: ListTile(
        title: const Text("Batch"),
        trailing: Text(Get.find<HiveDatabase>().userInfo?.batch ?? "",
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 25)),
      ));

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
                onPressed: () {
                  showAppAboutDialog(context);
                },
                icon: const Icon(Icons.assignment_rounded))
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
  Future<void> launchUrl(BuildContext context, String url) async {
    try {
      await launch(url);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Unable to open"),
      ));
    }
  }

  Widget themeMode() => Card(
        child: ListTile(
          title: const Text("Theme Mode"),
          subtitle: Text(Get.isDarkMode ? "Dark Mode" : "Light Mode"),
          onTap: () => controller.toogleThemeMode(),
        ),
      );

  Widget showLog() => Card(
        child: ListTile(
          title: const Text("Show Log"),
          trailing: const FaIcon(FontAwesomeIcons.caretRight),
          onTap: () => Get.toNamed(Routes.LOG_PAGE),
        ),
      );

  Widget themeSelector() => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: ListTile(
            title: const Text(
              "Theme",
              // style: ,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ThemeSelector(
                controller: controller,
              ),
            ),
          ),
        ),
      );

  void showAppAboutDialog(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.bodyText1!;
    final TextStyle footerStyle = themeData.textTheme.caption!;
    
    showAboutDialog(
      context: context,
      applicationName: 'Class Links',
      applicationVersion: 'Version:1.0',
      applicationIcon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            child: SvgPicture.asset(
              Assets.icons.dsc.path,
              semanticsLabel: 'A red up arrow',
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      applicationLegalese: 'Managed By GDSC Kiit',
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: aboutTextStyle,
                  text:
                      'This app aids in the efficient management of college classes '
                      ' by centralising the schedule and tasks. '
                      'Here, one can manage the entire college routine in one location, rather of having '
                      'to go from one location to another looking for classes and their linkages. \n\n',
                ),
                TextSpan(style: footerStyle, text: 'Contact us : '),
                TextSpan(
                    text: 'Gmail id',
                    style: footerStyle.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(context, 'mail@dsckiit.in');
                      }),
                TextSpan(
                    style: footerStyle, text: '\nContributing with code : '),
                TextSpan(
                    text: 'github repo',
                    style: footerStyle.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(
                            context, 'https://github.com/DSC-KIIT/class-links');
                      }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
