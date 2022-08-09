import 'package:class_link/services/firebase/models/report_models/report.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../usecase/report_usecase.dart';

const String reportKey = 'reports';

class ReportDatasources implements ReportUseecase {
  final FirebaseFirestore firestore;
  ReportDatasources({required this.firestore});

  @override
  Future<void> deleteReport(String refId) async =>
      await firestore.collection(reportKey).doc(refId).delete();

  @override
  Future<List<Report>> get getAllReports async =>
      (await firestore.collection(reportKey).get())
          .docs
          .map((doc) => Report.fromJson(doc.data()))
          .toList();

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

  @override
  Future<void> replyReport(String refId, Report report) async =>
      await firestore.collection(reportKey).doc(refId).update(report.toJson());

  @override
  Future<void> submitReport(Report report) async {
    await firestore.collection(reportKey).add(report.toJson()).then(
        (value) async =>
            await firestore.collection(reportKey).doc(value.id).update(
                  report.copyWith(docId: value.id).toJson(),
                ));
  }

  @override
  Future<void> updateReport(String refId, Report report) async =>
      await firestore.collection(reportKey).doc(refId).update(report.toJson());
}
