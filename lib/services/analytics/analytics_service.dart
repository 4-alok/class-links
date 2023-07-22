import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

import 'analytics_utils.dart';

const APP_OPENED = "app_opened";
const THEME_DATA = "theme_data";

class AnalysisService extends GetxService with AnalyticsUtile {
  final firebaseAnalytics = FirebaseAnalytics.instance;

  Future<void> appOpened() async {
    await firebaseAnalytics.logEvent(
      name: APP_OPENED,
    );
  }

  // Create a theme usage analysis event
  Future<void> themeUsageAnalysis() async {
    final appTheme = hiveDatabase.settingBoxDatasources.appTheme.value;
    await firebaseAnalytics.logEvent(
      name: THEME_DATA,
      parameters: {
        "theme": appTheme,
      },
    );
  }

  // Resouorces page open event.
  Future<void> resourcesPageOpenEvent() async {
    await firebaseAnalytics.logEvent(
      name: "resources_page_open",
    );
  }
}
