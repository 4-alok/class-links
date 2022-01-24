import '../../../models/time_table/time_table.dart';
import 'package:get/get.dart';

class SubjectInfoController extends GetxController {
  Subject? _subject;

  // ignore: constant_identifier_names
  static const String TAG = "subject_info_controller";

  final hour = 6.obs;

  Subject get subject =>
      _subject ??
      const Subject(
          subjectName: "No Info", startTime: DayTime(hour: 6, minute: 0));

  set subject(Subject? subject) {
    hour.value = _subject?.startTime.hour ?? 6;
    _subject = subject;
  }

  bool get isDay => hour.value >= 6 && hour.value <= 18;
  // bool get isDusk => hour.value >= 16 && hour.value <= 18;
}
