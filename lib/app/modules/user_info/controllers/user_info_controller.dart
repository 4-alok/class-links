import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/modules/user_info/views/components/select_batch.dart';
import 'package:class_link/app/modules/user_info/views/components/select_year.dart';
import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:class_link/app/services/local_database.dart';
import 'package:class_link/app/utils/get_snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  final PageController pageController = PageController();
  final SelectYearController selectYearController = SelectYearController();
  final BatchController batchController = BatchController();
  final currentPage = 0.obs;

  final appBarTitleList = <String>["Select Year", "Select Batch"];

  final list1 = <String>["A1", "A2", "A3", "A4", "A5"];
  final list2 = <String>["B1", "B2", "B3", "B4", "B5"];

  void nextPage() {}

  void onPageChange(int index) => currentPage.value = index;

  void fab() async {
    if (currentPage.value == 0) {
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    } else {
      if (_validateInfo()) {
        final UserInfo userInfo = UserInfo(
          id: Get.find<AuthService>().user!.email!,
          slot: batchController.slot.value!,
          batch: batchController.batch.value!,
          date: DateTime.now(),
          year: selectYearController.currentYear.value!,
        );
        if (await Get.find<FirestoreService>().addUserInfo(userInfo)) {
          await Get.find<HiveDatabase>().setUserInfo(userInfo);
          Get.offAllNamed(Routes.HOME);
        }
      }
    }
  }

  bool _validateInfo() {
    if (selectYearController.currentYear.value == null) {
      Message("Error", "Please select year");
    } else if (batchController.batch.value == null) {
      Message("Error", "Please select batch");
    } else if (batchController.slot.value == null) {
      Message("Error", "Please select slot");
    } else {
      return true;
    }
    return false;
  }

  @override
  void onClose() {
    pageController.dispose();
    selectYearController.dispose();
    batchController.dispose();
    super.onClose();
  }
}
