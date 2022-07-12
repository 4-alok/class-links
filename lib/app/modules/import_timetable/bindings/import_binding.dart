import 'package:class_link/app/modules/import_timetable/controllers/import_controller.dart';
import 'package:get/get.dart';

class ImportBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<ImportController>(() => ImportController());
}
