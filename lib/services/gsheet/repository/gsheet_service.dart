import 'package:class_link/global/utils/get_snackbar.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

import '../../../global/const/app_credentials.dart';
import '../datasources/ghseet_user_info_datasources.dart';
import '../datasources/resources_datasources.dart';
import '../datasources/sheet_timetable_datasources.dart';
import '../usecase/sheet_usecase.dart';

class GSheetService extends GetxService implements SheetUsecase {
  late final ResourcesDatasources resourcesDatasources;
  late final GSheetUserInfoDatasources gSheetUserInfoDatasources;
  late final SheetTimetableDatasources sheetTimetableDatasources;
  final gsheets = GSheets(credentials);
  final spreadsheetLoaded = false.obs;
  Spreadsheet? spreadsheet;

  @override
  void onInit() {
    resourcesDatasources = ResourcesDatasources(gSheetService: this);
    gSheetUserInfoDatasources = GSheetUserInfoDatasources(gSheetService: this);
    sheetTimetableDatasources = SheetTimetableDatasources(gSheetService: this);
    super.onInit();
  }

  @override
  Future<void> get loadSpreadSheet async =>
      await gsheets.spreadsheet(getGSheetsId).then((value) {
        spreadsheet = value;
        spreadsheetLoaded.value = true;
      }).onError((error, stackTrace) {
        Message("Error while loading spreadsheet", error.toString());
        spreadsheetLoaded.value = true;
      });

  @override
  String get getGSheetsId =>
      sheetURL.contains("/") ? sheetURL.split("/")[5] : sheetURL;

  @override
  void onClose() {
    gsheets.close();
    super.onClose();
  }
}
