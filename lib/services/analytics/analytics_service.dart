// ignore_for_file: constant_identifier_names

import 'package:class_link/global/utils/extension.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

import 'analytics_utils.dart';

const APP_OPENED = "app_opened";
const THEME_DATA = "theme_data";

class AnalysisService extends GetxService with AnalyticsUtile {
  final firebaseAnalytics = FirebaseAnalytics.instance;

/// This function is used to log the app open event of the user.
  Future<void> get appOpenLogEvent async {
    final userInfo = hiveDatabase.userBoxDatasources.userInfo;
    if (userInfo != null) {
      await firebaseAnalytics.logEvent(
        name: APP_OPENED,
        parameters: {
          "user_info": userInfo.toAnalyticsLog.toJson(),
        },
      );
    }
  }

  /// > This function is used to log the theme usage data of the user
  Future<void> themeUsageAnalysis() async {
    // final userInfo = hiveDatabase.userBoxDatasources.userInfo;
    // if (userInfo != null) {
    //   final themeData = ThemeUsageLog(
    //     isBlack: isBlack,
    //     themeModeLight: themeModeLight,
    //     themeName: hiveDatabase.settingBoxDatasources.appTheme.value.name,
    //   );
    //   await firebaseAnalytics.logEvent(
    //     name: THEME_DATA,
    //     parameters: {
    //       "user_info": userInfo.toAnalyticsLog.toJson(),
    //       "theme_data": themeData.toJson()
    //     },
    //   );
    // }
  }
}
