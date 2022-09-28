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

  @override
  Future<SheetData?> get getResourcesListCache async {
    final data = await cacheBox.getRequest("resources_$sheetName");
    if (data != null) {
      return SheetData.fromJson(data);
    } else {
      return null;
    }
  }

  Future<void> _saveResources(SheetData sheetData) async =>
      await cacheBox.saveRequest("resources_$sheetName", sheetData.toJson());

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
