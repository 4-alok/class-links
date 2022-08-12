import 'package:get/get.dart';

import '../controller/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<ReportController>(
        () => ReportController(),
      );
}
