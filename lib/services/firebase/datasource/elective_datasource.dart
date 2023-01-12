import 'package:class_link/global/models/time_table/time_table.dart';
import 'package:class_link/global/utils/csv_utils.dart';
import 'package:class_link/services/firebase/models/my_elective_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../global/const/elective_teachers.dart';
import '../../hive/repository/hive_database.dart';
import '../models/user_elective_section.dart';
import '../usecase/elective_usecase.dart';

const String userElectiveSection = 'user_elective_section';
const String thirdYearSection = '3rd_year_section';
const String thirdYeatElectiveTimetable = '3rd_year_elective_timetable';

class ElectiveDatasources implements ElectiveUsecase {
  final FirebaseFirestore firestore;
  ElectiveDatasources({required this.firestore});

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  @override
  Future<UserElectiveSection?> getUserElectiveSectoin(int rollNo) async {
    final res1 =
        await hiveDatabase.cacheBoxDataSources.getRequest(userElectiveSection);
    if (res1 != null) {
      return UserElectiveSection.fromMap(res1);
    } else {
      final res2 = await firestore
          .collection(userElectiveSection)
          .where("rollNo", isEqualTo: rollNo)
          .limit(1)
          .get();

      return UserElectiveSection.fromMap(res2.docs.first.data());
    }
  }

  @override
  Future<List<MyElectiveSubjects>> get getElectiveTimeTable async {
    final result = await CsvUtils.readCSVFile(
        'assets/database/3rd_year/6th_sem_elective_time_table.csv');
    final email = hiveDatabase.userBoxDatasources.userInfo?.id ?? "";
    final electiveSection = await getUserElectiveSectoin(
      int.tryParse(email.split("@")[0]) ?? 0,
    );
    final mySectionListRow = result
        .where((element) =>
            element[1] == electiveSection!.elective1Section ||
            element[1] == electiveSection.elective2Section)
        .toList();

    // [DAY,Section,ROOM1,11,ROOM2,12,ROOM3,13,ROOM4,15,ROOM5,16,ROOM6,17]
    // [Monday, ML_CS-2,  C-LH-405, ML(DE), C-LH-405, ML(DE),  C-LH-405, ML(DE), C-LH-405, ML(DE), C-LH-405, ML(DE), C-LH-405, ML(DE)]
    // [Monday, ML_CS-9, X, X, X, X, X, X, X, X, C-LH-401, ML(DE), X, X]
    // [Tuesday, ML_CS-2, X, X, X, X, X, X, X, X, X, X, X, X]
    // [Tuesday, ML_CS-9, X, X, X, X, X, X, X, X, X, X, X, X]
    // [Wednesday, ML_CS-2, X, X, C-LH-405, ML(DE), X, X, X, X, X, X, X, X]
    // [Wednesday, ML_CS-9, X, X, X, X, X, X, X, X, X, X, X, X]
    // [Thursday, ML_CS-2, X, X, X, X, X, X, X, X, C-LH-405, ML(DE), X, X]
    // [Thursday, ML_CS-9, X, X, X, X, X, X, C-LH-401, ML(DE), X, X, X, X]
    // [Friday, ML_CS-2, X, X, X, X, X, X, X, X, X, X, X, X]
    // [Friday, ML_CS-9, X, X, C-LH-401, ML(DE), X, X, X, X, X, X, X, X]

    final myElectiveSubjectsList = <MyElectiveSubjects>[];

    for (int i = 0; i < mySectionListRow.length; i++) {
      if (myElectiveSubjectsList.firstWhereOrNull(
              (element) => element.day == mySectionListRow[i][0]) ==
          null) {
        myElectiveSubjectsList.add(MyElectiveSubjects(
          day: mySectionListRow[i][0],
          subjects: _getSubjectList(mySectionListRow[i]),
        ));
      } else {
        myElectiveSubjectsList
            .firstWhere(
              (element) => element.day == mySectionListRow[i][0],
            )
            .subjects
            .addAll(_getSubjectList(mySectionListRow[i]));
      }
    }

    // print("----------------------------------------------------------------");
    // myElectiveSubjectsList.forEach((element) {
    //   print(element.day);
    //   element.subjects.forEach((s) {
    //     print(s);
    //   });
    //   print("\n");
    // });
    // print("----------------------------------------------------------------");

    return myElectiveSubjectsList;
  }

  // [DAY   | Section| ROOM1   | 11      |ROOM2    | 12    |ROOM3    | 13    | ROOM4   | 15    | ROOM5   | 16    | ROOM6   | 17    ]
  // [Monday| ML_CS-2| C-LH-405| ML(DE)  | C-LH-405| ML(DE)| C-LH-405| ML(DE)| C-LH-405| ML(DE)| C-LH-405| ML(DE)| C-LH-405| ML(DE)]
  // Subject(subjectName, roomNo, startTime)
  List<Subject> _getSubjectList(List<dynamic> row) {
    final subjectList = <Subject>[];
    for (int i = 3; i < row.length; i += 2) {
      if (row[i] != 'X') {
        subjectList.add(Subject(
          subjectName: row[i],
          roomNo: row[i - 1],
          electiveSubjectCode: row[1],
          isElective: true,
          teacherName: electiveTeachers[row[1]] ?? "No Info",
          startTime: DayTime(
              hour: i == 3
                  ? 11
                  : i == 5
                      ? 12
                      : i == 7
                          ? 13
                          : i == 9
                              ? 15
                              : i == 11
                                  ? 16
                                  : 17,
              minute: 0),
        ));
      }
    }
    return subjectList;
  }

  @override
  Future<void> addUserElectiveSection(UserElectiveSection section) async {
    await hiveDatabase.cacheBoxDataSources
        .saveRequest(userElectiveSection, section.toMap());
    await firestore.collection(userElectiveSection).add(section.toMap());
  }

  @override
  Future<List<String>> get getSectionList async {
    final list = await CsvUtils.readCSVFile(
        'assets/database/3rd_year/6th_sem_elective_time_table.csv');
    final electiveSections =
        {for (int i = 1; i < list.length; i++) list[i][1] as String}.toList();
    return electiveSections;
  }

  @override
  Future<Map<String, String>> get getSectionListWithTeacherName async {
    Map<String, String> sectionWithTeacherName = {};
    for (var element in await getSectionList) {
      sectionWithTeacherName[element] = electiveTeachers[element] ?? "";
    }
    return sectionWithTeacherName;
  }
}
