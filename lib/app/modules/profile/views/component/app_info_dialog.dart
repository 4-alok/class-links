import '../../../../gen/assets.gen.dart';
import '../../../../global/widget/launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class AppInfo {
  static void showAppAboutDialog(BuildContext context) {
    final TextStyle aboutTextStyle = Get.theme.textTheme.bodyText1!;
    final TextStyle footerStyle = Get.theme.textTheme.caption!;

    showAboutDialog(
      context: context,
      applicationName: 'Class Links',
      applicationVersion: 'Version: 0.1.0',
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
                  semanticsLabel: 'A red up arrow',
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
      applicationLegalese:
          'Copyright (c) 2024 Google Developer Student Club - KIIT\nMIT License',
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: aboutTextStyle,
                  text: "Open class-link with a single click. "
                      "Easily sync the same batch's schedule and class-link.\n\n",
                ),
                TextSpan(style: footerStyle, text: 'Contact us : '),
                TextSpan(
                    text: 'classlink@dsckiit.in',
                    style: footerStyle.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Launcher.launchUrl(
                          context, 'mailto:classlink@dsckiit.in')),
                TextSpan(
                    style: footerStyle, text: '\nContributions are welcomed '),
                TextSpan(
                    text: 'Github',
                    style: footerStyle.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Launcher.launchUrl(
                          context, 'https://github.com/DSC-KIIT/class-links')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
