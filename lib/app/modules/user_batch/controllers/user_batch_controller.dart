import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:class_link/app/services/hive_database.dart';
import 'package:get/get.dart';

class UserBatchController extends GetxController {
  final currentYear = Rx<int?>(null);
  final currentScheme = Rx<int?>(null);
  final currentBatch = Rx<String?>(null);
  final loading = Rx<bool>(false);

  List<String> get firstYearScheme1 =>
      List.generate(27, (index) => "A${index + 1}");

  List<String> get firstYearScheme2 =>
      List.generate(30, (index) => "B${index + 1}");

  List<String> get secondYear =>
      List.generate(26, (index) => "CSE ${index + 1}");

  List<String> get batchList {
    if (currentYear.value == 2) {
      return secondYear;
    } else if (currentYear.value == 1) {
      if (currentScheme.value == 1) {
        return firstYearScheme1;
      } else if (currentScheme.value == 2) {
        return firstYearScheme2;
      }
    }
    return [];
  }

  bool get showSubmitButton =>
      currentYear.value != null && currentBatch.value != null;

  Future<void> submit() async {
    loading.value = true;
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );

    final userInfo = UserInfo(
      id: Get.find<AuthService>().user!.email!,
      slot: currentScheme.value ?? 1,
      year: currentYear.value!,
      batch: currentBatch.value!,
      date: DateTime.now(),
    );

    if (await Get.find<FirestoreService>().addUserInfo(userInfo)) {
      await Get.find<HiveDatabase>().setUserInfo(userInfo);
      Get.offAllNamed(Routes.HOME);
    }

    loading.value = false;
  }
}
