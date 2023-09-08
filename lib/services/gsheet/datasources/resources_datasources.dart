import 'package:class_link/services/hive/utils/cache_key.dart';
import 'package:get/get.dart';

import '../../../global/models/sheet_data/sheet_data.dart';
import '../../hive/repository/hive_database.dart';
import '../repository/gsheet_service.dart';

const sheetName = 'index';

class ResourcesDatasources {
  final GSheetService gSheetService;
  ResourcesDatasources({required this.gSheetService});

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  Future<SheetData?> get getResourcesList async {
    try {
      return await hiveDatabase.getFromCacheOrFetch<SheetData>(
        key: CacheKey.SHEET_DATA,
        fetchData: getData,
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Getting the data from the spreadsheet.
  Future<SheetData> getData() async {
    final spreadsheet = await gSheetService.spreadsheet.future;
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
