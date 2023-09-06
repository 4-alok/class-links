import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

import '../../../../../global/const/app_info.dart';
import '../../../../../global/widget/launcher.dart';

class AppInfoDialog extends StatelessWidget {
  final String appVersion;
  const AppInfoDialog({required this.appVersion, super.key});

  TextStyle get aboutTextStyle => Get.theme.textTheme.bodyLarge!;
  TextStyle get footerStyle => Get.theme.textTheme.bodySmall!;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Material(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 130,
                    child: Row(children: [
                      Flexible(
                          flex: 2,
                          child: Center(
                            child: Image.asset(
                              "assets/icons/app_logo.png",
                              height: 100,
                              width: 100,
                            ),
                          )),
                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppInfo.appName,
                              style: Get.theme.textTheme.headlineSmall,
                            ),
                            Text(
                              appVersion,
                              style: Get.theme.textTheme.bodySmall,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              AppInfo.applicationLegalese,
                              style: Get.theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(height: 10),
                  aboutText(aboutTextStyle, footerStyle, context),
                  const SizedBox(height: 15),
                  socialLink(context),
                  const Divider(),
                  footer(context),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      );

  Widget footer(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(LicensePage(
                applicationName: AppInfo.appName,
                applicationVersion: appVersion,
                applicationLegalese: AppInfo.applicationLegalese,
              )),
              style: ElevatedButton.styleFrom(elevation: 0),
              child: const Text("View Licenses"),
            ),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () => Get.back(),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor.withOpacity(.1)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Close"),
              ),
            ),
          ],
        ),
      );

  Padding socialLink(BuildContext context) => Padding(
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
              FontAwesomeIcons.globe,
              "Web",
              () => Launcher.launchUrl(context, AppInfo.appWebUrl),
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

  Widget socialWidget(BuildContext context, IconData? icon, String text,
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
                style: Get.theme.textTheme.bodySmall!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );

  Widget aboutText(TextStyle aboutTextStyle, TextStyle footerStyle,
          BuildContext context) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(AppInfo.appInfo, style: aboutTextStyle),
      );
}

// class AppInfoBox {
//   static void showAppAboutDialog(BuildContext context, String appVersion) {
//     final TextStyle aboutTextStyle = Get.theme.textTheme.bodyLarge!;
//     final TextStyle footerStyle = Get.theme.textTheme.bodySmall!;

//     showAboutDialog(
//       context: context,
//       applicationName: AppInfo.appName,
//       applicationVersion: appVersion,
//       applicationIcon: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   "assets/icons/app_logo.png",
//                   height: 100,
//                   width: 100,
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//       applicationLegalese: AppInfo.applicationLegalese,
//       children: <Widget>[
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(height: 10),
//             aboutText(aboutTextStyle, footerStyle, context),
//             socialLink(context),
//           ],
//         ),
//       ],
//     );
//   }

//   static Padding socialLink(BuildContext context) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             socialWidget(
//               context,
//               FontAwesomeIcons.github,
//               "Github",
//               () => Launcher.launchUrl(context, AppInfo.github),
//             ),
//             socialWidget(
//               context,
//               FontAwesomeIcons.globe,
//               "Web",
//               () => Launcher.launchUrl(context, AppInfo.appWebUrl),
//             ),
//             socialWidget(
//               context,
//               FontAwesomeIcons.envelope,
//               "Mail",
//               () =>
//                   Launcher.launchUrl(context, 'mailto: ${AppInfo.supportMail}'),
//             ),
//           ],
//         ),
//       );

//   static Widget socialWidget(BuildContext context, IconData? icon, String text,
//           VoidCallback onTap) =>
//       Flexible(
//         flex: 1,
//         child: GestureDetector(
//           onTap: onTap,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               FaIcon(icon, size: 30),
//               Text(
//                 text,
//                 style: Get.theme.textTheme.bodySmall!,
//                 textAlign: TextAlign.center,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       );

//   static Widget aboutText(TextStyle aboutTextStyle, TextStyle footerStyle,
//           BuildContext context) =>
//       Text(AppInfo.appInfo, style: aboutTextStyle);
// }
