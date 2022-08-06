import '../../../app/modules/control_panel/controllers/get_csv_file.dart';
import '../../firebase/models/elective_timetable.dart';
import '../../firebase/models/user_section.dart';

class LocalDatabase with GetFile {
  Future<List<UserSecetion>> get getLocalUserSection async => getUserSections(
        await getDataFromAsset(
            'assets/database/3rd_year/3rd_year_user_section.csv'),
      );

  Future<List<ElectiveTimetable>> get getLocalElectiveTimetable async =>
      getElectiveTimetable(
        await getDataFromAsset(
            'assets/database/3rd_year/elective_timetable.csv'),
      );
}
