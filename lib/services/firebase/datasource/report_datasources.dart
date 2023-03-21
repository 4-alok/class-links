import 'package:class_link/services/firebase/models/report_models/report.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../usecase/report_usecase.dart';

const String reportKey = 'reports';

/// It's a class that implements the ReportUseecase and it's used to interact with the firestore
/// database
class ReportDatasources implements ReportUseecase {
  final FirebaseFirestore firestore;
  ReportDatasources({required this.firestore});

  /// Delete a report from the database
  ///
  /// Args:
  ///   refId (String): The unique id of the report.
  @override
  Future<void> deleteReport(String refId) async =>
      await firestore.collection(reportKey).doc(refId).delete();

  /// Getting all the reports from the database.
  @override
  Future<List<Report>> get getAllReports async =>
      (await firestore.collection(reportKey).get())
          .docs
          .map((doc) => Report.fromJson(doc.data()))
          .toList();

  /// Getting the reports that the user has submitted.
  @override
  Future<List<Report>> get getMyReports async {
    return (await firestore
            .collection(reportKey)
            .where('id',
                isEqualTo:
                    Get.find<HiveDatabase>().userBoxDatasources.userInfo?.id)
            .get())
        .docs
        .map((doc) => Report.fromJson(doc.data()))
        .toList();
  }

  /// It updates the report in the database.
  ///
  /// Args:
  ///   refId (String): The document id of the report.
  ///   report (Report): The report object that contains the report data.
  @override
  Future<void> replyReport(String refId, Report report) async =>
      await firestore.collection(reportKey).doc(refId).update(report.toJson());

  /// It adds a new report to the database and then updates the report with the document id.
  ///
  /// Args:
  ///   report (Report): The report object that you want to submit.
  @override
  Future<void> submitReport(Report report) async {
    await firestore.collection(reportKey).add(report.toJson()).then(
        (value) async =>
            await firestore.collection(reportKey).doc(value.id).update(
                  report.copyWith(docId: value.id).toJson(),
                ));
  }

  /// It updates the report in the database.
  ///
  /// Args:
  ///   refId (String): The document id of the report you want to update.
  ///   report (Report): The report object that you want to update.
  @override
  Future<void> updateReport(String refId, Report report) async =>
      await firestore.collection(reportKey).doc(refId).update(report.toJson());
}
