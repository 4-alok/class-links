import 'package:get/get.dart';

import '../../../global/models/subject_info/subject_info.dart';
import '../../../global/models/time_table/time_table.dart';

class SubjectInfoController extends GetxController {
  final emptySubjectInfo = const SubjectInfo(
      subject: Subject(
        subjectName: "No Info",
        startTime: DayTime(hour: 6, minute: 0),
      ),
      currentWeek: -1);

  SubjectInfo? _subjectInfo;


  // ignore: constant_identifier_names
  static const String TAG = "subject_info_controller";

  final hour = 6.obs;

  set subjectInfo(SubjectInfo? subjectInfo) =>
      _subjectInfo = (subjectInfo != null) ? subjectInfo : emptySubjectInfo;

  SubjectInfo get subjectInfo => _subjectInfo ?? emptySubjectInfo;

  bool get isDay => hour.value >= 6 && hour.value <= 18;
  // bool get isDusk => hour.value >= 16 && hour.value <= 18;


  bool get isClassOverOrOngoing =>
      DateTime.now().hour >= subjectInfo.subject.startTime.hour;



}
