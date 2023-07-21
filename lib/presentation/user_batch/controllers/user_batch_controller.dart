import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../global/utils/csv_utils.dart';
import '../../../global/utils/patch.dart';
import '../../../services/firebase/models/user_elective_section.dart';
import '../../../services/hive/models/user_info.dart';
import 'user_batch_list.dart';

class UserBatchController extends GetxController with UserBatchList {
  // 1, 2, 3, 4
  final currentYear = Rx<int?>(null);
  // 1, 2, 3, 4, 5, 6, 7, 8
  final currentSemester = Rx<int?>(null);
  // CSE, IT, CSSE, CSCE
  final currentStream = Rx<String?>(null);
  // CSE-1, CSE-2, CSE-3...
  final currentBatch = Rx<String?>(null);
  final currentElectiveSubject1 = Rx<String?>(null);
  final currentElectiveSubject2 = Rx<String?>(null);
  final loading = Rx<bool>(false);

  final dataAvailable = Rx<bool>(false);

  FirestoreService get firestoreService => Get.find<FirestoreService>();

  HiveDatabase get hivedatabaseServices => Get.find<HiveDatabase>();

  @override
  void onInit() {
    clearUserInfo;
    super.onInit();
  }

  @override
  void onReady() async {
    final email = Get.find<AuthService>().getUser?.email ?? "";

    if (email.startsWith("20")) {
      currentYear.value = 3;
      currentSemester.value = 5;
      dataAvailable.value = true;
    }
    // if (email.startsWith('22')) {
    //   currentYear.value = 3;
    //   currentSemester.value = 4;
    // } else if (await Patch.isRollNoInUserList(
    //     int.tryParse(email.split('@').first) ?? -1)) {
    //   currentYear.value = 3;
    //   currentSemester.value = 6;
    // } else if (email.startsWith("21")) {
    //   currentYear.value = 3;
    //   currentSemester.value = 4;
    // }
    // if (currentYear.value == 3) autoSelectSection();
    super.onReady();
  }

  Future<void> get clearUserInfo async {
    await hivedatabaseServices.userBoxDatasources.clearUserInfo;
  }

  Future<Map<String, String>> get getSectionListWithTeacherName async =>
      await firestoreService.electiveDatasources.getSectionListWithTeacherName;

  // Future autoSelectSection() async {
  //   try {
  //     final data =
  //         await CsvUtils.readCSVFile('assets/database/3rd_year/6_sem_user.csv');
  //     final rollNo = int.tryParse((Get.find<AuthService>().getUser?.email ?? "")
  //             .split('@')
  //             .first) ??
  //         -1;

  //     final section =
  //         (data.firstWhereOrNull((element) => element.first == rollNo) ?? [])
  //             .last as String;
  //     currentBatch.value =
  //         "${section.split("-").first}-${int.parse(section.split("-").last)}";
  //     currentStream.value = section.split("-").first;
  //   } catch (e) {
  //     null;
  //   }
  // }

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
    if (currentYear.value == 3) {
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

  bool get showSubmitButton => (currentYear.value == 3)
      ? currentYear.value != null &&
          currentBatch.value != null &&
          currentStream.value != null &&
          currentElectiveSubject1.value != null &&
          currentElectiveSubject2.value != null
      : currentYear.value != null && currentBatch.value != null;

  Future<void> submit() async {
    loading.value = true;
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    final user = Get.find<AuthService>().getUser!;

    final userInfo = UserInfo(
      id: user.email!,
      userName: user.displayName ?? "",
      year: currentYear.value!,
      batch: currentBatch.value!,
      stream: currentStream.value ?? "",
      date: DateTime.now(),
      role: 'viewer',
    );

    if (currentYear.value == 3) {
      final electiveSection = UserElectiveSection(
        rollNo: int.tryParse(user.email!.split('@').first) ?? -1,
        elective1Section: currentElectiveSubject1.value!,
        elective2Section: currentElectiveSubject2.value!,
      );
      await firestoreService.electiveDatasources
          .addUserElectiveSection(electiveSection);
    }

    // Add user info to firestore
    if (await firestoreService.userInfoDatasources.addUserInfo(userInfo)) {
      await hivedatabaseServices.userBoxDatasources.setUserInfo(userInfo);
      Get.offAllNamed(Routes.HOME);
    }

    loading.value = false;
  }

  @override
  void onClose() {
    currentYear.close();
    currentStream.close();
    currentBatch.close();
    currentSemester.close();
    loading.close();
    super.onClose();
  }
}
