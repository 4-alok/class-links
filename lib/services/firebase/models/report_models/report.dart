import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

enum ReportType { wrongTimetable, bug, suggestion, other }

@freezed
class Report with _$Report {
  const factory Report({
    @Default(null) String? docId,
    required String id,
    required String userId,
    required ReportType reportType,
    required String description,
    required DateTime dateTime,
    @Default(null) String? attatchmentUrl,
    @Default(null) String? reply,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
