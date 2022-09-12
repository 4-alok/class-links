import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

import '../../../global/const/credentials.dart';
import '../datasources/ghseet_user_info_datasources.dart';
import '../datasources/resources_datasources.dart';
import '../usecase/sheet_usecase.dart';

class GSheetService extends GetxService implements SheetUsecase {
  late final ResourcesDatasources resourcesDatasources;
  late final GSheetUserInfoDatasources gSheetUserInfoDatasources;
  final gsheets = GSheets(credentials);
  final spreadsheetLoaded = false.obs;
  Spreadsheet? spreadsheet;

  @override
  void onInit() {
    resourcesDatasources = ResourcesDatasources(gSheetService: this);
    gSheetUserInfoDatasources = GSheetUserInfoDatasources(gSheetService: this);
    super.onInit();
  }

  @override
  Future<void> get loadSpreadSheet async =>
      await gsheets.spreadsheet(getGSheetsId).then((value) {
        spreadsheet = value;
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
