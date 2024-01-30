import 'package:get/get.dart';

import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/gsheet/repository/gsheet_service.dart';
import '../../../services/hive/repository/hive_database.dart';

class SheetTestController {
  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();
  FirestoreService get firestoreService => Get.find<FirestoreService>();
  GSheetService get gSheetService => Get.find<GSheetService>();

  // void printTimetable(List<TimeTable> timetables) async {
  //   print("=============Printing Timetable=============");
  //   for (var t in timetables) {
  //     print(t.batch);
  //     for (var d in t.week) {
  //       print(d.day);
  //       print(d.subjects
  //           .map((e) => "${e.subjectName},${e.roomNo},${e.startTime.hour}||")
  //           .toList());
  //     }
  //     print("\n\n");
  //   }
  //   print("=============Printing Timetable=============");
  // }

  Future<void> streamTimetable() async {
    // hiveDatabase
    //     .streamCachedDataOrFetch<TimeTables?>(
    //   key: CacheKey.TIME_TABLES,
    //   duration: const Duration(minutes: 5),
    //   fetchData: () {
    //     final res = Get.find<GSheetService>()
    //         .sheetTimetableDatasources
    //         .getTimetableData;

    //     return res;
    //   },
    // )
    //     .listen((event) async {
    //   if (event == null) {
    //     // timeTableText.value = "No Data";
    //   } else {
    //     final t = TimetableTaskUtils();

    //     final tp1 = await t.filterToMySection(event);
    //     final tp2 = await t.addElectiveSubjects(tp1);
    //     // printTimetable(tp2.timeTables);
    //   }
    // });
  }
}
