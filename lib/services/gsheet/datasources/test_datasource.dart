import '../repository/gsheet_service.dart';

class GSheetsTestDatasource {
  final GSheetService gSheetService;
  const GSheetsTestDatasource({required this.gSheetService});

  Future<void> addTestSheet() async {
    final sheet = await gSheetService.spreadsheet.future;
    // check weather "test" worksheet is already present or not
    if (sheet!.worksheetByTitle('test') != null) {
      await sheet.addWorksheet('test');
    }
    // final worksheet = sheet!.worksheetByTitle('test');
    // await worksheet!.appendRow(row);
  }

  Future<void> deleteTestSheet() async {
    final sheet = await gSheetService.spreadsheet.future;
    if (sheet!.worksheetByTitle('test') != null) {
      await sheet.deleteWorksheet(sheet.worksheetByTitle('test')!);
    }
  }

  Future<void> addRow(List<String> row) async {
    final sheet = await gSheetService.spreadsheet.future;
    final worksheet = sheet!.worksheetByTitle('test');
    await worksheet!.values.appendRow(row);
  }

  // Future<void> addRowAtIndex(List<String> row, int index) async {
  //   final sheet = await gSheetService.spreadsheet.future;
  //   final worksheet = sheet!.worksheetByTitle('test');
  //   worksheet!.
  //   await worksheet.values.insertRow(index, row);
  // }
}
