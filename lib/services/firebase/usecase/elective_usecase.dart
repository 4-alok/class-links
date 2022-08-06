
import '../models/elective_timetable.dart';
import '../models/user_section.dart';

abstract class ElectiveUsecase {
  Future<void> importElectiveTimetable(ElectiveTimetable electiveTimetable);
  Future<void> importUserElectiveSection(UserSecetion userSection);
  Future<List<ElectiveTimetable>> getUserElectiveSubjects(
      {required bool local});
  Future<UserSecetion?> getUserSection({required bool local});
}
