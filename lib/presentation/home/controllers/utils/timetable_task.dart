import 'package:class_link/services/hive/utils/cache_key.dart';
import 'package:get/get.dart';

import '../../../../global/models/time_table/time_table.dart';
import '../../../../services/firebase/models/my_elective_list.dart';
import '../../../../services/firebase/models/user_elective_section.dart';
import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/gsheet/models/my_teacher_model.dart';
import '../../../../services/gsheet/repository/gsheet_service.dart';
import '../../../../services/hive/repository/hive_database.dart';

class TimetableTaskUtils {
  // Dependency Injection: GetX ------------------------------//
  FirestoreService get firestoreService => Get.find<FirestoreService>();
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  GSheetService get gSheetService => Get.find<GSheetService>();
  // --------------------------------------------------------//

  Future<TimeTable> addElectiveSubjects(TimeTable timeTable) async {
    if (![6]
        .contains(hiveDatabase.userBoxDatasources.userInfo.value?.semester)) {
      return timeTable;
    }

    final UserElectiveSection electiveSection = UserElectiveSection(
      rollNo: int.tryParse(hiveDatabase.userBoxDatasources.userInfo.value!.id) ?? 0,
      elective1Section: hiveDatabase.userBoxDatasources.userInfo.value!.electiveSections.first,
      elective2Section: hiveDatabase.userBoxDatasources.userInfo.value!.electiveSections.last,
    );

    final List<MyElectiveSubjects> myElectiveTable =
        await gSheetService.electiveDatasources.getElectiveTimeTable(
      electiveSection,
    );

    final week = _deepCopyWeek(timeTable.week);

    for (final element in myElectiveTable) {
      switch (element.day.substring(0, 3).toUpperCase()) {
        case "MON":
          week[0].subjects.addAll(element.subjects);
          break;
        case "TUE":
          week[1].subjects.addAll(element.subjects);
          break;
        case "WED":
          week[2].subjects.addAll(element.subjects);
          break;
        case "THU":
          week[3].subjects.addAll(element.subjects);
          break;
        case "FRI":
          week[4].subjects.addAll(element.subjects);
          break;
        case "SAT":
          week[5].subjects.addAll(element.subjects);
          break;
      }
    }

    // sorting the subjects according to the time
    for (final element in week) {
      element.subjects
          .sort((a, b) => a.startTime.hour.compareTo(b.startTime.hour));
    }

    return timeTable.copyWith(week: week);
  }

  Future<TimeTable> addTeacherNames(TimeTable timeTable) async {
    final myTeachers = await hiveDatabase.getFromCacheOrFetch<MyTeachers>(
      key: CacheKey.MY_TEACHERS,
      checkExpired: true,
      duration: const Duration(days: 1),
      fetchData: gSheetService.teacherInfoDatasource.fetchMyTeachers,
    );

    if (myTeachers == null) return timeTable;

    return timeTable.copyWith(
      week: List.generate(
        timeTable.week.length,
        (dayIndex) => timeTable.week[dayIndex].copyWith(
          subjects: List.generate(
            timeTable.week[dayIndex].subjects.length,
            (index) =>
                timeTable.week[dayIndex].subjects[index].teacherName != null
                    ? timeTable.week[dayIndex].subjects[index]
                    : timeTable.week[dayIndex].subjects[index].copyWith(
                        teacherName: myTeachers.teachers
                                .firstWhereOrNull((element) =>
                                    element.subjectName ==
                                    timeTable.week[dayIndex].subjects[index]
                                        .subjectName)
                                ?.teacherName ??
                            "No info"),
          ),
        ),
      ),
    );
  }

  List<Day> _deepCopyWeek(List<Day> originList) =>
      originList.map((e) => Day.fromJson(e.toJson())).toList();
}
