import 'package:get/get.dart';

import '../controllers/log_page_controller.dart';

class LogPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogPageController>(
      () => LogPageController(),
    );
  }
}
