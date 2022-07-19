import 'package:get/get.dart';

import '../analytics/analytics_service.dart';

abstract class ThemeAnalyticsLog {
  Future<void> get addThemeLog async =>
      await Get.find<AnalysisService>().themeUsageAnalysis();
}
