import '../models/report_models/report.dart';

abstract class ReportUseecase {
  Future<void> submitReport(Report report);
  Future<List<Report>> get getMyReports;
  Future<void> updateReport(String refId, Report report);
  Future<List<Report>> get getAllReports;
  Future<void> replyReport(String refId, Report report);
  Future<void> deleteReport(String id);
}
