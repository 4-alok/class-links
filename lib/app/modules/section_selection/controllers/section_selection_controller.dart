import 'package:get/get.dart';

class SectionSelectionController extends GetxController {
  final sectionIndex = 0.obs;
  final sectionIndexNumber = 0.obs;
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

  void setSectionIndex(int i) {
    sectionIndex.value = i;
  }
 void setSectionIndexNumber(int i) {
    sectionIndexNumber.value = i;
  }
}
