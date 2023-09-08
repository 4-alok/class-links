import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  AppInfo._();

  static const String appName = "Class Link";
  static const String applicationLegalese = "Copyright (c) 2024\nMIT License";
  static const String supportMail = "app.classlink@gmail.com";
  static const String appInfo =
      "View the current class with just one click. Get holidays list, Resources(notes and PYQs) and more.";
  static const String appUrl =
      "https://play.google.com/store/apps/details?id=com.application.class_link";
  static const String linkedInURL = "https://www.linkedin.com/in/4-alok";
  static const String appWebUrl = "https://class-link-04.web.app";
  static const String github = "https://github.com/4-alok/class-links";

  static const Map<String, String> developer = {
    'Sanskar Kashyap, Lead Marketing & Content Management':
        'https://avatars.githubusercontent.com/u/72290416?v=4,https://www.instagram.com/sanskar_kashyap_308/',
    'Jyotsana Singh,App Logo':
        'https://avatars.githubusercontent.com/u/73690777?v=4,https://github.com/jyotsana279',
  };

  static Future<String> get appVersion async =>
      "v${(await PackageInfo.fromPlatform()).version}";

  static Future<String> get buildNumber async =>
      (await PackageInfo.fromPlatform()).buildNumber;
}
