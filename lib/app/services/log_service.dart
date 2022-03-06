import '../global/const/credentials.dart';
import '../models/log/log.dart';
import '../models/user_info/user_info.dart';
import 'hive_database.dart';
import '../utils/extension.dart';
import '../utils/get_snackbar.dart';
import '../utils/gsheet_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

// isolated thread
List<LogData> _listRowToListLog(List<List<String>> rowList) =>
    rowList.toListLogData.toList().reversed.toList();

class GoogleSheetService extends GetxService {
  final _gsheet = GSheets(SheetCredentials.credentials);
  UserInfo? get _userInfo => Get.find<HiveDatabase>().userInfo;

  Future<bool?> addEntry(List<LogData> logs) async {
    try {
      final Spreadsheet spreadsheet = await _gsheet.spreadsheet(
          GSheetUtils.getGSheetsId(SheetCredentials.spreadsheetId));
      final _userInfo = this._userInfo!;
      final _worksheetTitle =
          "${_userInfo.year}-${_userInfo.slot}-${_userInfo.batch}";

      Worksheet? worksheet = spreadsheet.worksheetByTitle(_worksheetTitle);
      worksheet ??= await spreadsheet.addWorksheet(_worksheetTitle);
      return await worksheet.values.appendRows(logs.toSheetRowList);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Message("Error while adding log", "Try again later");
    }
    return null;
  }

  Future<List<LogData>?> get readLog async {
    final Spreadsheet spreadsheet = await _gsheet
        .spreadsheet(GSheetUtils.getGSheetsId(SheetCredentials.spreadsheetId));
    final _userInfo = this._userInfo!;
    final _worksheetTitle =
        "${_userInfo.year}-${_userInfo.slot}-${_userInfo.batch}";
    Worksheet? worksheet = spreadsheet.worksheetByTitle(_worksheetTitle);
    worksheet ??= await spreadsheet.addWorksheet(_worksheetTitle);
    return await compute(_listRowToListLog, await worksheet.values.allRows());
  }
}
