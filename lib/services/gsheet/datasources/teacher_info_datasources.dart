// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:class_link/services/gsheet/models/my_teacher_model.dart';
import 'package:get/get.dart';

import '../../hive/models/user_info.dart';
import '../../hive/repository/hive_database.dart';
import '../repository/gsheet_service.dart';

const sheetName = 'teachers';

class TeacherInfoDatasource {
  final GSheetService gSheetService;
  TeacherInfoDatasource({required this.gSheetService});

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  UserInfo? get userInfo => hiveDatabase.userBoxDatasources.userInfo.value;

  // @override
  // Future<MyTeachers?> get getMyTeachersCached async {
  //   final result = await hiveDatabase.cacheBoxDataSources.getRequest(sheetName);
  //   return result != null ? MyTeachers.fromMap(result) : null;
  // }

  Future<MyTeachers> fetchMyTeachers() async {
    // while (gSheetService. == false) {
    //   await Future.delayed(const Duration(milliseconds: 400));
    // }
    final spreadsheet = await gSheetService.spreadsheet.future;
    if (spreadsheet != null) {
      final workSheet =
          spreadsheet.worksheetByTitle("${userInfo?.semester}-$sheetName");
      if (workSheet != null) {
        final r = await workSheet.values.allRows();
        final myResult = r.where((e) => e.first == userInfo?.batch).first;
        final myTeachers = MyTeachers(
          batch: myResult.first,
          teachers: <Teacher>[
            for (int i = 1; i < myResult.length; i += 2)
              Teacher(
                  teacherName: myResult[i] == "" ? 'No Info' : myResult[i],
                  subjectName: myResult[i + 1])
          ],
        );
        // await hiveDatabase.cacheBoxDataSources
        //     .saveRequest(sheetName, myTeachers.toMap());
        return myTeachers;
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }
}
