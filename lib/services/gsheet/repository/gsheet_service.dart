import 'dart:async';

import '../../../global/utils/get_snackbar.dart';
import '../datasources/teacher_info_datasources.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

import '../../../global/const/app_credentials.dart';
import '../datasources/elective_datasource.dart';
import '../datasources/ghseet_user_info_datasources.dart';
import '../datasources/resources_datasources.dart';
import '../datasources/sheet_timetable_datasources.dart';

class GSheetService extends GetxService {
  late final ResourcesDatasources resourcesDatasources;
  late final GSheetUserInfoDatasources gSheetUserInfoDatasources;
  late final ElectiveDatasources electiveDatasources;
  late final SheetTimetableDatasources sheetTimetableDatasources;
  late final TeacherInfoDatasource teacherInfoDatasource;
  final gsheets = GSheets(credentials);
  final spreadsheet = Completer<Spreadsheet?>();

  @override
  void onInit() {
    resourcesDatasources = ResourcesDatasources(gSheetService: this);
    gSheetUserInfoDatasources = GSheetUserInfoDatasources(gSheetService: this);
    sheetTimetableDatasources = SheetTimetableDatasources(gSheetService: this);
    electiveDatasources = ElectiveDatasources();
    teacherInfoDatasource = TeacherInfoDatasource(gSheetService: this);
    loadSpreadSheet;
    super.onInit();
  }

  Future<void> get loadSpreadSheet async {
    try {
      spreadsheet.complete(await gsheets.spreadsheet(getGSheetsId));
    } catch (e) {
      Message("Error while loading spreadsheet", e.toString());
    }
  }

  String get getGSheetsId =>
      sheetURL.contains("/") ? sheetURL.split("/")[5] : sheetURL;

  @override
  void onClose() {
    gsheets.close();
    super.onClose();
  }
}
