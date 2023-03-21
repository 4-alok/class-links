import '../models/report_models/report.dart';

/// It's a class that defines the methods that will be used to interact with the reports collection in
/// the database
abstract class ReportUseecase {
  Future<void> submitReport(Report report);
  Future<List<Report>> get getMyReports;
  Future<void> updateReport(String refId, Report report);
  Future<List<Report>> get getAllReports;
  Future<void> replyReport(String refId, Report report);
  Future<void> deleteReport(String id);
}
