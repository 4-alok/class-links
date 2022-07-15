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

  @override
  void dispose() {
    csvController.dispose;
    importUserSectionSection.dispose;
    super.dispose();
  }
}
