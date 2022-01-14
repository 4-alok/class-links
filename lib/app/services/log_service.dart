import 'package:class_link/app/global/const/credentials.dart';
import 'package:class_link/app/models/log/log.dart';
import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/services/hive_database.dart';
import 'package:class_link/app/utils/extension.dart';
import 'package:class_link/app/utils/gsheet_utils.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

class GoogleSheetSerevice extends GetxService {
final _gsheet = GSheets(SheetCredentials.credentials);
  UserInfo? get _userInfo => Get.find<HiveDatabase>().userInfo;

  Future<bool?> addEntry(List<LogData> logs) async {
   final Spreadsheet spreadsheet =
        await _gsheet.spreadsheet(GSheetUtils.getGSheetsId(""));
    final _userInfo = this._userInfo!;
    final _worksheetTitle =
        "${_userInfo.year}-${_userInfo.slot}-${_userInfo.batch}";

    Worksheet? worksheet = spreadsheet.worksheetByTitle(_worksheetTitle);
    worksheet ??= await spreadsheet.addWorksheet(_worksheetTitle);
    return await worksheet.values.appendRows(logs.toSheetRowList);
  }

  Future<Iterable<LogData>?> readLog() async {
    final Spreadsheet spreadsheet =
        await _gsheet.spreadsheet(GSheetUtils.getGSheetsId(""));
    final _userInfo = this._userInfo!;
    final _worksheetTitle =
        "${_userInfo.year}-${_userInfo.slot}-${_userInfo.batch}";

    Worksheet? worksheet = spreadsheet.worksheetByTitle(_worksheetTitle);
    worksheet ??= await spreadsheet.addWorksheet(_worksheetTitle);

    return (await worksheet.values.allRows()).toListLogData;
  }
}
