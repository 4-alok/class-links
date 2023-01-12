// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:class_link/services/gsheet/models/my_teacher_model.dart';
import 'package:class_link/services/gsheet/usecase/teacher_info_usecase.dart';
import 'package:get/get.dart';

import '../../hive/models/user_info.dart';
import '../../hive/repository/hive_database.dart';
import '../repository/gsheet_service.dart';

const sheetName = 'teachers';

class TeacherInfoDatasource implements TeacherInfoUsecase {
  final GSheetService gSheetService;
  TeacherInfoDatasource({required this.gSheetService});

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  UserInfo? get userInfo => hiveDatabase.userBoxDatasources.userInfo;

  @override
  Future<MyTeachers?> get getMyTeachersCached async {
    final result = await hiveDatabase.cacheBoxDataSources.getRequest(sheetName);
    return result != null ? MyTeachers.fromMap(result) : null;
  }

  @override
  Future<MyTeachers> get fetchMyTeachers async {
    while (gSheetService.spreadsheetLoaded.value == false) {
      await Future.delayed(const Duration(milliseconds: 400));
    }
    final spreadsheet = gSheetService.spreadsheet;
    if (spreadsheet != null) {
      final workSheet =
          spreadsheet.worksheetByTitle("${userInfo?.year}-$sheetName");
      if (workSheet != null) {
        final myResult = (await workSheet.values.allRows())
            .where((e) => e.first == userInfo?.batch)
            .first;
        final myTeachers = MyTeachers(
          batch: myResult.first,
          teachers: <Teacher>[
            for (int i = 1; i < myResult.length; i += 2)
              Teacher(
                  name: myResult[i] == "" ? 'No Info' : myResult[i],
                  subject: myResult[i + 1])
          ],
        );
        await hiveDatabase.cacheBoxDataSources
            .saveRequest(sheetName, myTeachers.toMap());
        return myTeachers;
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }
}
