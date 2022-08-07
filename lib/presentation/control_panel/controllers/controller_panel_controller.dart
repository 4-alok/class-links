import 'package:get/get.dart';

import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../global/models/time_table/time_table.dart';
import 'import_csv_controller.dart';
import 'import_elective_timetable.dart';
import 'import_user_sectoin_csv.dart';

class ControlPanelController extends GetxController {
  final csvController = ImportCsvController();
  final importUserSectionSection = ImportUserSectionSection();
  final import3YearElectiveTimetable = Import3YearElectiveTimetable();
  final fromYear = Rx<int?>(null);
  final toYear = Rx<int?>(null);

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

  @override
  void dispose() {
    csvController.dispose;
    importUserSectionSection.dispose;
    import3YearElectiveTimetable.dispose;
    super.dispose();
  }
}
