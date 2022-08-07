import 'package:freezed_annotation/freezed_annotation.dart';

import '../time_table/time_table.dart';

part 'subject_info.freezed.dart';

@freezed
class SubjectInfo with _$SubjectInfo {
  const factory SubjectInfo({
    required Subject subject,
    required int currentWeek,
  }) = _SubjectInfo;
}
