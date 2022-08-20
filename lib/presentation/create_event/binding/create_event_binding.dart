import 'package:get/get.dart';

import '../controller/create_event_controller.dart';

class CreateEventBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<CreateEventController>(() => CreateEventController());
}
