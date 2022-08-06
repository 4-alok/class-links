import '../controllers/controller_panel_controller.dart';
import 'package:get/get.dart';

class ControlPanelBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<ControlPanelController>(() => ControlPanelController());
}
