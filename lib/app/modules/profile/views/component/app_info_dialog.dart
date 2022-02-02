import 'package:class_link/app/global/const/app_info.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../global/widget/launcher.dart';
import 'package:flutter/gestures.dart';
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
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: aboutTextStyle,
                  text: AppInfo.appInfo,
                ),
                TextSpan(style: footerStyle, text: 'Contact us : '),
                TextSpan(
                    text: AppInfo.supportMail,
                    style: footerStyle.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Launcher.launchUrl(
                          context, 'mailto: ${AppInfo.supportMail}')),
                TextSpan(
                    style: footerStyle, text: '\nContributions are welcomed '),
                TextSpan(
                    text: 'Github',
                    style: footerStyle.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Launcher.launchUrl(context, AppInfo.github)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
