import '../models/my_elective_list.dart';
import '../models/user_elective_section.dart';

abstract class ElectiveUsecase {
  Future<UserElectiveSection?> getUserElectiveSectoin(int rollNo);
  Future<void> addUserElectiveSection(UserElectiveSection section);
  Future<List<String>> get getSectionList;
  Future<Map<String, String>> get getSectionListWithTeacherName;
  Future<List<MyElectiveSubjects>> get getElectiveTimeTable;
}
