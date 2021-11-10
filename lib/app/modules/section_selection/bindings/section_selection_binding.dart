import 'package:get/get.dart';

import '../controllers/section_selection_controller.dart';

class SectionSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SectionSelectionController>(
      () => SectionSelectionController(),
    );
  }
}
