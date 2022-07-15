import 'package:class_link/app/modules/user_batch/controllers/user_batch_list.dart';

import '../../../models/user_info/user_info.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/hive/hive_database.dart';
import 'package:get/get.dart';

class UserBatchController extends GetxController with UserBatchList {
  final currentYear = Rx<int?>(null);
  final currentStream = Rx<String?>(null);
  final currentScheme = Rx<int?>(null);
  final currentBatch = Rx<String?>(null);
  final loading = Rx<bool>(false);

  List<String> get getStreamList {
    if (currentYear.value == null) {
      return [];
    } else if (currentYear.value == 2) {
      return ['CSE', 'IT'];
    } else if (currentYear.value == 3) {
      return ['CSE', 'IT', 'CSSE'];
    } else {
      return [];
    }
  }

  List<String> get batchList {
    if (currentYear.value == 2) {
      if (currentStream.value != null) {
        if (currentStream.value == "CSE") {
          return secondYearCSE;
        } else if (currentStream.value == "IT") {
          return secondYearIT;
        }
      }
    } else if (currentYear.value == 1) {
      if (currentScheme.value == 1) {
        return firstYearScheme1;
      } else if (currentScheme.value == 2) {
        return firstYearScheme2;
      }
    } else if (currentYear.value == 3) {
      if (currentStream.value != null) {
        if (currentStream.value == "CSE") {
          return thirdYearCSE;
        } else if (currentStream.value == "IT") {
          return thirdYearIT;
        } else if (currentStream.value == 'CSSE') {
          return thirdYearCSSE;
        }
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

    final user = Get.find<AuthService>().user!;

    final userInfo = UserInfo(
      id: user.email!,
      userName: user.displayName ?? "",
      slot: currentScheme.value ?? 1,
      year: currentYear.value!,
      batch: currentBatch.value!,
      stream: currentStream.value ?? "1st Year",
      date: DateTime.now(),
    );

    if (await Get.find<FirestoreService>().userInfoDatasources.addUserInfo(userInfo)) {
      await Get.find<HiveDatabase>().setUserInfo(userInfo);
      Get.offAllNamed(Routes.HOME);
    }

    loading.value = false;
  }

  @override
  void onClose() {
    currentYear.close();
    currentStream.close();
    currentScheme.close();
    currentBatch.close();
    loading.close();
    super.onClose();
  }
}
