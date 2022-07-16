import 'package:class_link/app/services/firebase/models/elective_timetable.dart';

import '../models/user_section.dart';

abstract class ElectiveUsecase {
  Future<void> importElectiveTimetable(ElectiveTimetable electiveTimetable);
  Future<void> importUserElectiveSection(UserSecetion userSection);
  Future<List<ElectiveTimetable>> get getUserElectiveSubjects;
  Future<UserSecetion?> get getUserSection;
}
