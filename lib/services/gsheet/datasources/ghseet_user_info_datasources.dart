import 'package:class_link/services/hive/models/user_info.dart';

import '../repository/gsheet_service.dart';
import '../usecase/users_usercase.dart';
import '../utils/gsheet_utils.dart';

const sheetName = 'users';

class GSheetUserInfoDatasources
    with GSheetUtils
    implements GSheetUsersInfoUsecase {
  final GSheetService gSheetService;
  GSheetUserInfoDatasources({required this.gSheetService});

  @override
  Future<bool> addUserInfo(UserInfo user) async {
    try {
      return gSheetService.spreadsheetLoaded.value
          ? await _addUserInfo(user)
          : await gSheetService.loadSpreadSheet
              .then<bool>((value) async => await _addUserInfo(user));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> _addUserInfo(UserInfo user) async {
    final spreadsheet = gSheetService.spreadsheet;
    if (spreadsheet != null) {
      final workSheet = spreadsheet.worksheetByTitle(sheetName);
      if (workSheet != null) {
        await workSheet.values.appendRow(userToSheetRow(user));
        return true;
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }

  Future<void> _addAllList(List<UserInfo> users) async {
    final spreadsheet = gSheetService.spreadsheet;
    if (spreadsheet != null) {
      final workSheet = spreadsheet.worksheetByTitle(sheetName);
      if (workSheet != null) {
        await workSheet.values
            .appendRows(users.map((e) => userToSheetRow(e)).toList());
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }

  @override
  Future<List<UserInfo>> get getAllUserList async {
    try {
      return gSheetService.spreadsheetLoaded.value
          ? _getAllUserList
          : await gSheetService.loadSpreadSheet
              .then<Future<List<UserInfo>>>((value) => _getAllUserList);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<UserInfo>> get _getAllUserList async {
    final spreadsheet = gSheetService.spreadsheet;
    if (spreadsheet != null) {
      final sheetData = spreadsheet.worksheetByTitle(sheetName);
      if (sheetData != null) {
        final rowList = await sheetData.values.allRows();
        return rowList.map((e) => sheetRowToUser(e)).toList();
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }
}
