import '../../../utils/extension.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/instance_manager.dart';

import '../../../global/const/const.dart';
import '../../../models/log/log.dart';
import '../../../models/time_table/time_table.dart';
import '../../../services/auth/auth_service.dart';
import '../../../utils/get_snackbar.dart';

mixin TimeTableCrudOperationMixin {
  // copy of originalList
  final week = Rx<List<Day>>([]);
  //  original list
  List<Day> originalList = List.generate(
    7,
    (index) => Day(day: Days.days[index], subjects: []),
  );

  List<LogData> logData = [];

  void get defaultDays => week.value = List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );

  void addSubject(Day day, Subject subject, bool updateAllLink) {
    if (day.subjects
        .where((e) => e.startTime.hour == subject.startTime.hour)
        .isEmpty) {
      week.update((val) =>
          week.value.firstWhere((e) => e.day == day.day).subjects.add(subject));
      updateAllLink ? _updateAllLink(subject) : null;
      createLog("${subject.subjectName} added to ${day.day}");
    } else {
      Message("Error", "Subject already exists at this time");
    }
  }

  void createLog(String changes) {
    final user = Get.find<AuthService>().user;
    logData.add(
      LogData(
          name: user?.displayName ?? "",
          email: user?.email ?? "",
          log: changes,
          date: DateTime.now()),
    );
  }

  void updateSubject(String subjectDay, Subject oldSubject, Subject newSubject,
      bool updateAllLink) {
    final day = week.value.firstWhere((e) => e.day == subjectDay);
    week.update((val) => day.subjects[day.subjects
        .indexWhere((element) => element == oldSubject)] = newSubject);

    updateAllLink ? _updateAllLink(newSubject) : null;
    if (oldSubject.remark != newSubject.remark) {
      createLog(
          "${newSubject.subjectName} remark changed to '${newSubject.remark}' for $subjectDay");
    } else {
      createLog("${newSubject.subjectName} updated for $subjectDay");
    }
  }

  void removeSubject(Subject subject, String day) => week.update((val) {
        createLog("Removed ${subject.subjectName} from $day");
        week.value.firstWhere((e) => e.day == day).subjects.remove(subject);
      });

  void finishReorder(
      Subject subject, int from, int to, List<Subject> subjects, String day) {
    week.value.firstWhere((e) => e.day == day).subjects.clear();
    week.value.firstWhere((e) => e.day == day).subjects.addAll(subjects);
  }

  bool get _isNotEqual {
    try {
      for (int i = 0; i < originalList.length; i++) {
        if (!originalList[i].equals(week.value[i])) return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  String? get validate {
    if (!_isNotEqual) return "No changes made";
    for (final day in week.value) {
      for (int i = 1; i < day.subjects.length; i++) {
        final beforeSubTime = day.subjects[i - 1].startTime;
        final startingTime = day.subjects[i].startTime;
        if (((startingTime.hour * 60) + startingTime.minute) <
            ((beforeSubTime.hour * 60) + beforeSubTime.minute)) {
          return "Error at ${day.subjects[i - 1].subjectName}\nArrange subjects in order";
        }
      }
    }
    return null;
  }

  void _updateAllLink(Subject subject) => week.value = week.value
      .map((day) => day.copyWith(
            subjects: day.subjects
                .map((subject) => (subject.subjectName == subject.subjectName)
                    ? subject.copyWith(
                        googleClassRoomLink: subject.googleClassRoomLink,
                        gLinkAddBy: subject.gLinkAddBy,
                        zoomLink: subject.zoomLink,
                        zLinkAddBy: subject.zLinkAddBy,
                      )
                    : subject)
                .toList(),
          ))
      .toList();

  List<Day> deepCopyWeek(List<Day> originList) =>
      originList.map((e) => Day.fromJson(e.toJson())).toList();
}
