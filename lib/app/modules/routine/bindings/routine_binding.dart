import 'package:get/get.dart';

import '../controllers/routine_controller.dart';

class RoutineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoutineController>(
      () => RoutineController(),
    );
  }
}
