import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../global/const/app_info.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../global/widget/launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

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
                SvgPicture.asset(
                  Assets.icons.dsc.path,
                  height: 40,
                  width: 40,
                ),
                const SizedBox(height: 10),
                Text(
                  "GDSC TEAM",
                  style: aboutTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "KIIT",
                  style: aboutTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      applicationLegalese: AppInfo.applicationLegalese,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              aboutText(aboutTextStyle, footerStyle, context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      () => Launcher.launchUrl(context, AppInfo.instagramURL),
                    ),
                    socialWidget(
                      context,
                      FontAwesomeIcons.envelope,
                      "Mail",
                      () => Launcher.launchUrl(
                          context, 'mailto: ${AppInfo.supportMail}'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

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
