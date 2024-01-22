import 'package:class_link/services/firebase/repository/firestore_service.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../services/firebase/models/report_models/report.dart';

const List<String> reportTypeText = [
  'Bug',
  'Suggestion',
  'Wrong Timetable',
  'Other'
];

class ReportController extends GetxController {
  final descriptionTextController = TextEditingController();
  final attatchmentUrlTextController = TextEditingController();
  final submitting = false.obs;
  final reportType = Rx<String?>(null);

  List<String> get getReportTypeText => reportTypeText;
  FirestoreService get firestoreService => Get.find<FirestoreService>();
  Future<List<Report>> get getMyReport async =>
      await firestoreService.reportDatasources.getMyReports;

  Future<void> get submitReport async {
    submitting.value = true;
    final userInfo = Get.find<HiveDatabase>().userBoxDatasources.userInfo.value;
    final report = Report(
        id: userInfo?.id ?? "",
        userId: userInfo?.userName ?? "",
        reportType: _getReportType,
        description: descriptionTextController.text,
        attatchmentUrl: attatchmentUrlTextController.text,
        dateTime: DateTime.now());
    await Get.find<FirestoreService>().reportDatasources.submitReport(report);
    submitting.value = false;
  }

  ReportType get _getReportType {
    switch (reportType.value) {
      case 'Bug':
        return ReportType.bug;
      case 'Suggestion':
        return ReportType.suggestion;
      case 'Wrong Timetable':
        return ReportType.wrongTimetable;
      case 'Other':
        return ReportType.other;
      default:
        return ReportType.other;
    }
  }

  String getText(ReportType reportType) {
    switch (reportType) {
      case ReportType.bug:
        return reportTypeText[0];
      case ReportType.suggestion:
        return reportTypeText[1];
      case ReportType.wrongTimetable:
        return reportTypeText[2];
      case ReportType.other:
        return reportTypeText[3];
    }
  }

  @override
  void onClose() {
    descriptionTextController.dispose();
    attatchmentUrlTextController.dispose();
    super.onClose();
  }
}
