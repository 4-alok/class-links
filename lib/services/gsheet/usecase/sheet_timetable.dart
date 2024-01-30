import '../../../global/models/sheet_data/sheet_data.dart';

abstract class SheetTimetableUsecase {
  Future<SheetData> get getSheetRowsList;
  Future get getTimetableData;
}
