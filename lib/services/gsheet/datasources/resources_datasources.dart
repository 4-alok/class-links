import 'package:class_link/services/gsheet/usecase/resources_usecase.dart';
import 'package:get/get.dart';

import '../../../global/models/sheet_data/sheet_data.dart';
import '../../hive/datasource/cache_box_datasources.dart';
import '../../hive/repository/hive_database.dart';
import '../repository/gsheet_service.dart';

const sheetName = 'index';

class ResourcesDatasources implements ResourcesUsecase {
  final GSheetService gSheetService;
  ResourcesDatasources({required this.gSheetService});

  CacheBoxDataSources get cacheBox =>
      Get.find<HiveDatabase>().cacheBoxDataSources;

  /// Getting the cached data from the cacheBox.
  @override
  Future<SheetData?> get getResourcesListCache async {
    final data = await cacheBox.getRequest("resources_$sheetName");
    if (data != null) {
      return SheetData.fromJson(data);
    } else {
      return null;
    }
  }

  /// It saves the data from the sheet to the cache box
  ///
  /// Args:
  ///   sheetData (SheetData): The data that you want to save.
  Future<void> _saveResources(SheetData sheetData) async =>
      await cacheBox.saveRequest("resources_$sheetName", sheetData.toJson());

  /// Checking if the spreadsheet is loaded or not. If it is loaded, it will get the data from the
  /// spreadsheet. If it is not loaded, it will load the spreadsheet and then get the data.
  @override
  Future<SheetData> get getResourcesList async {
    try {
      final res = gSheetService.spreadsheetLoaded.value
          ? await getData
          : await gSheetService.loadSpreadSheet
              .then<SheetData>((value) async => await getData);
      await _saveResources(res);
      return res;
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Getting the data from the spreadsheet.
  Future<SheetData> get getData async {
    final spreadsheet = gSheetService.spreadsheet;
    if (spreadsheet != null) {
      final sheetData = spreadsheet.worksheetByTitle(sheetName);
      if (sheetData != null) {
        return SheetData(rowList: await sheetData.values.allRows());
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }
}
