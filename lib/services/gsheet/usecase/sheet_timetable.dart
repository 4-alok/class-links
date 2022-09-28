import '../../../global/models/sheet_data/sheet_data.dart';
import '../../../global/models/time_table/time_table.dart';

abstract class SheetTimetableUsecase {
  /// Get the sheet rows list by sheetName
  Future<SheetData> get getSheetRowsList;
  Future<TimeTable?> get getMyTimetableCache;
  Future<TimeTable> get getMyTimetable;
  Future get getTimetableData;
}
