import 'package:get/get.dart';

import '../controller/event_controller.dart';

class EventsBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<EventsController>(() => EventsController());
}
