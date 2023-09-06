import 'package:get/get.dart';

class ControlPanelController extends GetxController {
  // final csvController = ImportCsvController();
  // final importUserSectionSection = ImportUserSectionSection();
  // final import3YearElectiveTimetable = Import3YearElectiveTimetable();
  final fromYear = Rx<int?>(null);
  final toYear = Rx<int?>(null);

  // Future<List<int>> get getTimetableYearly async {
  //   List<int> year = [];
  //   final timetables =
  //       await Get.find<FirestoreService>().timetableDatasource.getAllTimetable;

  //   for (TimeTable t in timetables) {
  //     if (!year.contains(t.year)) {
  //       year.add(t.year);
  //     }
  //   }
  //   return year;
  // }

  /// Submits a test report to Firestore for the current user.
  // Future<void> get submitTestReport async {
  //   final userInfo = Get.find<HiveDatabase>().userBoxDatasources.userInfo!;
  //   final report = Report(
  //     id: userInfo.id,
  //     userId: userInfo.userName,
  //     reportType: ReportType.other,
  //     dateTime: DateTime.now(),
  //     description: "Test Report",
  //   );
  //   await Get.find<FirestoreService>().reportDatasources.submitReport(report);
  // }

  // @override
  // void dispose() {
  //   // csvController.dispose;
  //   // importUserSectionSection.dispose;
  //   // import3YearElectiveTimetable.dispose;
  //   super.dispose();
  // }
}
