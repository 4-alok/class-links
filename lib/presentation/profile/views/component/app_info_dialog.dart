import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

import '../../../../../global/const/app_info.dart';
import '../../../../../global/widget/launcher.dart';

class AppInfoBox {
  static void showAppAboutDialog(BuildContext context) {
    final TextStyle aboutTextStyle = Get.theme.textTheme.bodyText1!;
    final TextStyle footerStyle = Get.theme.textTheme.caption!;

    showAboutDialog(
      context: context,
      applicationName: AppInfo.appName,
      applicationVersion: AppInfo.appVersion,
      applicationIcon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/icons/app_logo.png",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
      applicationLegalese: AppInfo.applicationLegalese,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            aboutText(aboutTextStyle, footerStyle, context),
            socialLink(context),
          ],
        ),
      ],
    );
  }

  static Padding socialLink(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            socialWidget(
              context,
              FontAwesomeIcons.github,
              "Github",
              () => Launcher.launchUrl(context, AppInfo.github),
            ),
            socialWidget(
              context,
              FontAwesomeIcons.instagram,
              "Instagram",
              () => Launcher.launchUrl(context, AppInfo.linkedInURL),
            ),
            socialWidget(
              context,
              FontAwesomeIcons.envelope,
              "Mail",
              () =>
                  Launcher.launchUrl(context, 'mailto: ${AppInfo.supportMail}'),
            ),
          ],
        ),
      );

  static Widget socialWidget(BuildContext context, IconData? icon, String text,
          VoidCallback onTap) =>
      Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(icon, size: 30),
              Text(
                text,
                style: Get.theme.textTheme.caption!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );

  static Widget aboutText(TextStyle aboutTextStyle, TextStyle footerStyle,
          BuildContext context) =>
      Text(AppInfo.appInfo, style: aboutTextStyle);
}
