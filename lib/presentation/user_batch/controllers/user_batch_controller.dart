import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../services/hive/models/user_info.dart';
import 'user_batch_list.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
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
      return ['CSE', 'IT', 'CSSE', 'CSCE'];
    } else if (currentYear.value == 3) {
      return ['CSE', 'IT', 'CSSE', 'CSCE'];
    } else {
      return [];
    }
  }

  List<String> get batchList {
    if (currentYear.value == 1) {
      return firstYear;
    } else if (currentYear.value == 2) {
      if (currentStream.value != null) {
        if (currentStream.value == "CSE") {
          return secondYearCSE;
        } else if (currentStream.value == "IT") {
          return secondYearIT;
        } else if (currentStream.value == "CSSE") {
          return secondYearCSSE;
        } else if (currentStream.value == "CSCE") {
          return secondYearCSCE;
        }
      }
    } else if (currentYear.value == 3) {
      if (currentStream.value != null) {
        if (currentStream.value == "CSE") {
          return thirdYearCSE;
        } else if (currentStream.value == "IT") {
          return thirdYearIT;
        } else if (currentStream.value == 'CSSE') {
          return thirdYearCSSE;
        } else if (currentStream.value == 'CSCE') {
          return thirdYearCSCE;
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

    final user = Get.find<AuthService>().getUser!;

    final userInfo = UserInfo(
      id: user.email!,
      userName: user.displayName ?? "",
      slot: currentScheme.value ?? 1,
      year: currentYear.value!,
      batch: currentBatch.value!,
      stream: currentStream.value ?? "1st Year",
      date: DateTime.now(),
      role: 'viewer',
    );

    if (await Get.find<FirestoreService>()
        .userInfoDatasources
        .addUserInfo(userInfo)) {
      await Get.find<HiveDatabase>().userBoxDatasources.setUserInfo(userInfo);
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
