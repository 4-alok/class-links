import '../../utils/get_snackbar.dart';
import '../../../services/auth/repository/auth_service_repo.dart';
import 'package:get/get.dart';

import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/gsheet/repository/gsheet_service.dart';
import '../../../services/hive/models/user_info.dart';
import '../../../services/hive/repository/hive_database.dart';
import '../../data/students_list.dart';

class BatchSelectionDialogController extends GetxController {
  BatchSelectionDialogController({this.initialUserInfo});
  final UserInfo? initialUserInfo;

  // 1, 2, 3, 4
  // final currentYear = Rx<int?>(null);
  // 1, 2, 3, 4, 5, 6, 7, 8
  final currentSemester = Rx<int?>(null);
  // CSE, IT, CSSE, CSCE
  final currentStream = Rx<String?>(null);
  // CSE-1, CSE-2, CSE-3...
  final currentBatch = Rx<String?>(null);
  final currentElectiveSubject1 = Rx<String?>(null);
  final currentElectiveSubject2 = Rx<String?>(null);
  final savingInProcess = Rx<bool>(false);
  final errorText = Rx<String?>(null);

  final firebaseUser = Get.find<AuthService>().getUser;

  String get email => firebaseUser?.email ?? "";

  FirestoreService get firestoreService => Get.find<FirestoreService>();
  GSheetService get gSheetService => Get.find<GSheetService>();
  HiveDatabase get hivedatabaseServices => Get.find<HiveDatabase>();

  @override
  void onReady() async {
    super.onReady();
    final rollNo = int.tryParse(email.split("@")[0]) ?? -1;
    if (initialUserInfo != null) {
      currentSemester.value = initialUserInfo!.semester;
      currentStream.value = initialUserInfo!.stream;
      currentBatch.value = initialUserInfo!.batch;
      currentElectiveSubject1.value = initialUserInfo!.electiveSections[0];
      currentElectiveSubject2.value = initialUserInfo!.electiveSections[1];
    } else if (sixthSemStudentRolls.contains(rollNo)) {
      currentSemester.value = 6;
    }
  }

  List<String> get getStreamList {
    if ([1, 2, 3, 4, 5, 6].contains(currentSemester.value)) {
      return ['CSE', 'IT', 'CSSE', 'CSCE'];
    } else {
      return [];
    }
  }

  List<String> get batchList =>
      (currentSemester.value == null || currentStream.value == null)
          ? <String>[]
          : _yearStreamMap[currentSemester.value]?[currentStream.value] ??
              <String>[];

  Future<Map<String, String>> get getSectionListWithTeacherName async =>
      await gSheetService.electiveDatasources.getSectionListWithTeacherName;

  Future<UserInfo?> save() async {
    savingInProcess.value = true;

    if (firebaseUser != null && validate) {
      late final UserInfo userInfo;
      if (initialUserInfo == null) {
        userInfo = UserInfo(
          id: email,
          userName: firebaseUser!.displayName ?? "",
          semester: currentSemester.value!,
          stream: currentStream.value!,
          batch: currentBatch.value!,
          electiveSections: [
            currentElectiveSubject1.value ?? "",
            currentElectiveSubject2.value ?? "",
          ],
          role: "user",
          joiningDate: DateTime.now(),
        );
      } else {
        userInfo = initialUserInfo!.copyWith(
          userName: firebaseUser!.displayName ?? "",
          semester: currentSemester.value!,
          stream: currentStream.value!,
          batch: currentBatch.value!,
          lastUpdated: DateTime.now(),
          electiveSections: [
            currentElectiveSubject1.value ?? "",
            currentElectiveSubject2.value ?? "",
          ],
        );
      }

      try {
        if (initialUserInfo == null) {
          await gSheetService.gSheetUserInfoDatasources.addUserInfo(userInfo);
          await hivedatabaseServices.userBoxDatasources.setUserInfo(userInfo);
          // await firestoreService.userInfoDatasources.addUserInfo(userInfo);
        } else {
          await gSheetService.gSheetUserInfoDatasources
              .updateUserInfo(userInfo);
          await hivedatabaseServices.userBoxDatasources.setUserInfo(userInfo);
          // await firestoreService.userInfoDatasources.updateUserInfo(userInfo);
        }
        savingInProcess.value = false;
        return userInfo;
      } catch (e) {
        Message("Error while saving data", "Please try again");
        savingInProcess.value = false;
        return null;
      }
    } else {
      savingInProcess.value = false;
      return null;
    }
  }

  bool get validate {
    if (currentStream.value == null) {
      errorText.value = "Please select stream";
      return false;
    } else if (currentBatch.value == null) {
      errorText.value = "Please select batch";
      return false;
    } else if (currentElectiveSubject1.value == null) {
      errorText.value = "Please select elective subject 1";
      return false;
    } else if (currentElectiveSubject2.value == null) {
      errorText.value = "Please select elective subject 2";
      return false;
    } else if (currentElectiveSubject1.value == currentElectiveSubject2.value) {
      errorText.value = "Please select different elective subjects";
      return false;
    } else {
      errorText.value = null;
      return true;
    }
  }

  static Map<int, Map<String, List<String>>> get _yearStreamMap => {
        4: {
          "CSE": List.generate(39, (index) => "CSE-${index + 1}"),
          "IT": List.generate(4, (index) => "IT-${index + 1}"),
          "CSSE": List.generate(2, (index) => "CSSE-${index + 1}"),
          "CSCE": List.generate(2, (index) => "CSCE-${index + 1}"),
        },
        6: {
          "CSE": List.generate(55, (index) => "CSE-${index + 1}"),
          "IT": List.generate(5, (index) => "IT-${index + 1}"),
          "CSSE": List.generate(3, (index) => "CSSE-${index + 1}"),
          "CSCE": List.generate(2, (index) => "CSCE-${index + 1}"),
        },
      };
}
