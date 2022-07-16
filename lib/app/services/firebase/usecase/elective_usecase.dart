import 'package:class_link/app/services/firebase/models/elective_timetable.dart';

import '../models/user_section.dart';

abstract class ElectiveUsecase {
  Future<void> importElectiveTimetable(
      List<ElectiveTimetable> electiveTimetables);
  Future<void> importUserElectiveSection(List<UserSecetion> userSections);
}
