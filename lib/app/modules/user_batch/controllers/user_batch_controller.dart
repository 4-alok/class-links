import '../../../global/const/batch_list.dart' as BatchList;
import '../../../models/user_info/user_info.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/firebase/firestore_service.dart';
import '../../../services/hive/hive_database.dart';
import 'package:get/get.dart';

class UserBatchController extends GetxController {
  final currentYear = Rx<int?>(null);
  final currentStream = Rx<String?>(null);
  final currentScheme = Rx<int?>(null);
  final currentBatch = Rx<String?>(null);
  final loading = Rx<bool>(false);

  List<String> get firstYearScheme1 => BatchList.firstYearScheme1;

  List<String> get firstYearScheme2 =>
      List.generate(30, (index) => "B${index + 1}");

  List<String> get secondYearCSE =>
      List.generate(26, (index) => "CSE ${index + 1}");

  List<String> get secondYearIT =>
      List.generate(7, (index) => "IT ${index + 1}");

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

    final _user = Get.find<AuthService>().user!;

    final userInfo = UserInfo(
      id: _user.email!,
      userName: _user.displayName ?? "",
      slot: currentScheme.value ?? 1,
      year: currentYear.value!,
      batch: currentBatch.value!,
      stream: currentStream.value!,
      date: DateTime.now(),
    );

    if (await Get.find<FirestoreService>().addUserInfo(userInfo)) {
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
