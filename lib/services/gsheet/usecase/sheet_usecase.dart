abstract class SheetUsecase {
  /// Get the id from URL
  String get getGSheetsId;

  /// Load spreadsheet
  Future<void> get loadSpreadSheet;
}
