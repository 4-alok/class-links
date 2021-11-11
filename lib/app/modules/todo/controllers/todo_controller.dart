import 'package:get/get.dart';

class TodoController extends GetxController {
  final selectedIndex = 0.obs;
  final title = ''.obs;
  final description = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setSelectedIndex(int i) {
    selectedIndex.value = i;
  }

  void setTitle(String title) {
    this.title.value = title;
  }

  void setDescription(String desc) {
    description.value = desc;
  }
}
