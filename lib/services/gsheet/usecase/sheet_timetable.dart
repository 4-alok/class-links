abstract class SheetTimetableUsecase {
    /// Get the sheet rows list by sheetName
  Future<List<List<String>>> get getSheetRowsList;

  Future get getTimetableData;
}
