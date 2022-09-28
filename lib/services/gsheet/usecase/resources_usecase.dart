import '../../../global/models/sheet_data/sheet_data.dart';

abstract class ResourcesUsecase {
  /// Get the sheet rows list by sheetName
  Future<SheetData> get getResourcesList;
  Future<SheetData?> get getResourcesListCache;
}
