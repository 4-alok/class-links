import '../analytics/analytics_service.dart';
import 'package:get/get.dart';

abstract class ThemeAnalyticsLog {
  Future<void> get addThemeLog async =>
      await Get.find<AnalysisService>().themeUsageAnalysis();
}
