import '../models/my_elective_list.dart';
import '../models/user_elective_section.dart';

/// This class is used to get the user's elective section, add the user's elective section, get the list
/// of sections and get the list of sections with teacher name
abstract class ElectiveUsecase {
  Future<UserElectiveSection?> getUserElectiveSection(int rollNo);
  Future<void> addUserElectiveSection(UserElectiveSection section);
  Future<List<String>> get getSectionList;
  Future<Map<String, String>> get getSectionListWithTeacherName;
  Future<List<MyElectiveSubjects>> get getElectiveTimeTable;
}
