import 'package:class_link/services/gsheet/usecase/resources_usecase.dart';

import '../repository/gsheet_service.dart';

const sheetName = 'index';

class ResourcesDatasources implements ResourcesUsecase {
  final GSheetService gSheetService;
  ResourcesDatasources({required this.gSheetService});

  @override
  Future<List<List<String>>> get getSheetRowsList async {
    try {
      return gSheetService.spreadsheetLoaded.value
          ? getData
          : await gSheetService.loadSpreadSheet
              .then<Future<List<List<String>>>>((value) => getData);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<List<String>>> get getData async {
    final spreadsheet = gSheetService.spreadsheet;
    if (spreadsheet != null) {
      final sheetData = spreadsheet.worksheetByTitle(sheetName);
      if (sheetData != null) {
        return await sheetData.values.allRows();
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }
}
