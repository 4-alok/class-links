import 'package:class_link/services/gsheet/repository/gsheet_service.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/repository/hive_database.dart';
import '../../../services/firebase/models/user_elective_section.dart';
import '../../../services/hive/models/user_info.dart';
import 'user_batch_list.dart';

// ignore: constant_identifier_names
enum CurrentStream { CSE, IT, CSSE, CSCE }

const _enumToStreamMap = {
  CurrentStream.CSE: "CSE",
  CurrentStream.IT: "IT",
  CurrentStream.CSSE: "CSSE",
  CurrentStream.CSCE: "CSCE",
};

const _streamToEnumMap = {
  "CSE": CurrentStream.CSE,
  "IT": CurrentStream.IT,
  "CSSE": CurrentStream.CSSE,
  "CSCE": CurrentStream.CSCE,
};

class BatchSelectionController extends GetxController {
  // 1, 2, 3, 4
  final currentYear = Rx<int?>(null);
  // 1, 2, 3, 4, 5, 6, 7, 8
  final currentSemester = Rx<int?>(null);
  // CSE, IT, CSSE, CSCE
  final currentStream = Rx<CurrentStream?>(null);
  // CSE-1, CSE-2, CSE-3...
  final currentBatch = Rx<String?>(null);
  final currentElectiveSubject1 = Rx<String?>(null);
  final currentElectiveSubject2 = Rx<String?>(null);
  final loading = Rx<bool>(false);
  final pageLoading = Rx<bool>(false);

  late final String email;

  final showSectionSelectionForm = Rx<bool>(false);

  FirestoreService get firestoreService => Get.find<FirestoreService>();
  GSheetService get gSheetService => Get.find<GSheetService>();
  HiveDatabase get hivedatabaseServices => Get.find<HiveDatabase>();

  @override
  void onInit() {
    email = Get.find<AuthService>().getUser?.email ?? "";
    super.onInit();
  }

  @override
  void onReady() async {
    await hivedatabaseServices.cacheBoxDataSources.clearAllCache();
    if (email.startsWith("21")) {
      currentYear.value = 3;
      currentSemester.value = 5;
      showSectionSelectionForm.value = true;
    } else if (email.startsWith("22")) {
      currentYear.value = 2;
      currentSemester.value = 3;
      showSectionSelectionForm.value = true;
    } else if (isSpecialF7(email)) {
      pageLoading.value = true;
      currentYear.value = 4;
      currentSemester.value = 7;
      currentStream.value = CurrentStream.CSE;
      currentBatch.value = "F7";
      submit();
    }
    super.onReady();
  }

  static bool isSpecialF7(String email) {
    try {
      final rollNoInt = int.parse(email.substring(0, 7));
      return rollNoInt >= 2005802 && rollNoInt <= 2005936;
    } catch (e) {
      return false;
    }
  }

  // Future<void> get clearUserInfo async =>
  //     await hivedatabaseServices.userBoxDatasources.clearUserInfo;

  // Getting the list of sections from the gsheet (assets)
  Future<Map<String, String>> get getSectionListWithTeacherName async =>
      await gSheetService.electiveDatasources.getSectionListWithTeacherName;

  List<String> get getStreamList {
    if (currentYear.value == 3 || currentYear.value == 2) {
      return ['CSE', 'IT', 'CSSE', 'CSCE'];
    } else {
      return [];
    }
  }

  List<String> get batchList =>
      (currentYear.value == null || currentStream.value == null)
          ? []
          : UserBatchList.yearStreamMap[currentYear.value]
                  ?[currentStream.value] ??
              [];

  void on3rdLateralEntry() {
    currentYear.value = 3;
    currentSemester.value = 5;
    showSectionSelectionForm.value = true;
  }

  bool get showSubmitButton => (currentYear.value == 3)
      ? currentYear.value != null &&
          currentBatch.value != null &&
          currentStream.value != null &&
          currentElectiveSubject1.value != null &&
          currentElectiveSubject2.value != null
      : currentYear.value != null && currentBatch.value != null;

  Future<void> submit() async {
    loading.value = true; // Set the loading state to true
    await Future.delayed(
        const Duration(milliseconds: 500)); // Wait for 500 milliseconds

    final user = Get.find<AuthService>().getUser!; // Get the user object

    // Create a UserInfo object
    final userInfo = UserInfo(
      id: user.email!,
      userName: user.displayName ?? "",
      year: currentYear.value!,
      batch: currentBatch.value!,
      stream: currentStreamString,
      semester: currentSemester.value!,
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

  Future<void> continueResourceOnly() async {
    await hivedatabaseServices.settingBoxDatasources
        .saveIsResourceOnly(true)
        .then((value) => Get.offAllNamed(Routes.RESOURCES));
    Get.offAllNamed(Routes.RESOURCES);
  }

  String get currentStreamString => _enumToStreamMap[currentStream.value] ?? "";

  CurrentStream? currentStreamEnum(String? stream) => _streamToEnumMap[stream];

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
