import 'package:get/get.dart';

import '../controllers/servers_controller.dart';

class ServersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServersController>(
      () => ServersController(),
    );
  }
}
