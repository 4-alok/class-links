import 'package:class_link/app/modules/import_timetable/controllers/import_elective_timetable.dart';
import 'package:class_link/app/services/firebase/repository/firestore_service.dart';
import 'package:get/get.dart';

import '../../../models/time_table/time_table.dart';
import 'import_csv_controller.dart';
import 'import_user_sectoin_csv.dart';

class ImportController extends GetxController {
  final csvController = ImportCsvController();
  final importUserSectionSection = ImportUserSectionSection();
  final fromYear = Rx<int?>(null);
  final toYear = Rx<int?>(null);
  final uploading = RxBool(false);
  final count = Rx<int?>(null);

  Future<List<int>> get getTimetableYearly async {
    List<int> year = [];
    final timetables =
        await Get.find<FirestoreService>().timetableDatasource.getAllTimetable;

    for (TimeTable t in timetables) {
      if (!year.contains(t.year)) {
        year.add(t.year);
      }
    }
    return year;
  }

  Future<void> get import async {
    uploading.value = true;
    await Get.find<FirestoreService>()
        .timetableDatasource
        .addTimeTables(await csvController.getTimeTables);
    uploading.value = false;
  }

  Future<void> get print async => csvController.printTimetable(
        await csvController.getTimeTables,
      );

  Future<void> get import3YearElectiveTimetable async {
    final import3YearElectiveTimetable = Import3YearElectiveTimetable();
    final electiveTimetables =
        await import3YearElectiveTimetable.electiveTimetable;

    for (int i = 0; i < electiveTimetables.length; i++) {
      count.value = i;
      await Get.find<FirestoreService>()
          .electiveDatasources
          .importElectiveTimetable(electiveTimetables[i]);
    }
    count.value = null;
  }

  @override
  void dispose() {
    csvController.dispose;
    importUserSectionSection.dispose;
    super.dispose();
  }
}
