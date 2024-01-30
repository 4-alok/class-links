import '../../auth/datasources/auth_datasources.dart';
import '../../hive/models/user_info.dart';
import '../../hive/repository/hive_database.dart';
import 'package:get/get.dart';

import '../../hive/utils/cache_key.dart';
import '../repository/gsheet_service.dart';
import '../usecase/users_usecase.dart';
import '../utils/gsheet_utils.dart';

const sheetName = 'users_v4';

class GSheetUserInfoDatasources
    with GSheetUtils
    implements GSheetUsersInfoUsecase {
  final GSheetService gSheetService;
  GSheetUserInfoDatasources({required this.gSheetService});

  HiveDatabase get _hdb => Get.find<HiveDatabase>();

  @override
  Future<bool> addUserInfo(UserInfo user) async {
    try {
      return gSheetService.spreadsheet.isCompleted
          ? await _addUserInfo(user)
          : await gSheetService.spreadsheet.future
              .then<bool>((value) async => await _addUserInfo(user));
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Adds user information to the Google Sheets.
  /// Returns `true` if the user information is successfully added, otherwise throws an exception.
  ///
  /// Parameters:
  /// - `user`: The user information to be added.
  ///
  /// Throws:
  /// - `Exception`: If there is an error while fetching the worksheet data or the spreadsheet.
  Future<bool> _addUserInfo(UserInfo user) async {
    final spreadsheet = await gSheetService.spreadsheet.future;
    if (spreadsheet != null) {
      final workSheet = spreadsheet.worksheetByTitle(sheetName);
      if (workSheet != null) {
        final appended = await workSheet.values.appendRow(userToSheetRow(user));

        // updating cache if update is successful ---------//
        if (appended) {
          await _hdb.cacheBoxDataSources
              .getCache<List<UserInfo>?>(CacheKey.ALL_USER_LIST)
              .then((value) {
            if (value != null) {
              value.add(user);
              _hdb.updateCache(value, CacheKey.ALL_USER_LIST);
            }
          });
        }
        // -----------------------------------------------//

        return true;
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }

  // Future<void> addUsersList(List<UserInfo> users) async {
  //   final spreadsheet = await gSheetService.spreadsheet.future;
  //   if (spreadsheet != null) {
  //     final workSheet = spreadsheet.worksheetByTitle(sheetName);
  //     if (workSheet != null) {
  //       final appended = await workSheet.values
  //           .appendRows(users.map((e) => userToSheetRow(e)).toList());
  //
  //       // updating cache if update is successful ---------//
  //       if (appended) {
  //         _hdb.updateCache(users, CacheKey.ALL_USER_LIST);
  //       }
  //       // -----------------------------------------------//
  //     } else {
  //       throw Exception("Error while fetching worksheet data");
  //     }
  //   } else {
  //     throw Exception("Error while fetching spreadsheet");
  //   }
  // }

  @override
  Future<List<UserInfo>> getAllUserList() async {
    try {
      return gSheetService.spreadsheet.isCompleted
          ? _getAllUserList
          : await gSheetService.spreadsheet.future
              .then<Future<List<UserInfo>>>((value) => _getAllUserList);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserInfo?> getUserInfo() async =>
      (await getAllUserList()).firstWhereOrNull((element) =>
          element.id == Get.find<AuthDatasources>().user.value?.email);

  /// Retrieves a list of [UserInfo] objects by fetching data from a Google Sheets spreadsheet.
  ///
  /// Returns a [Future] that resolves to a list of [UserInfo] objects.
  /// Throws an [Exception] if there is an error while fetching the worksheet data or the spreadsheet.
  Future<List<UserInfo>> get _getAllUserList async {
    final spreadsheet = await gSheetService.spreadsheet.future;
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

  /// Updates the user information in the Google Sheets.
  ///
  /// Returns `true` if the update is successful, otherwise throws an exception.
  /// The user information is updated at the specified index in the worksheet.
  /// If the update is successful, the cache is also updated with the new user information.
  ///
  /// Throws an exception if there is an error while fetching the worksheet data or the spreadsheet.
  Future<bool> updateUserInfo(UserInfo user) async {
    final users = await getAllUserList();
    final index = users.indexWhere((element) => element.id == user.id);
    final spreadsheet = await gSheetService.spreadsheet.future;
    if (spreadsheet != null) {
      final sheetData = spreadsheet.worksheetByTitle(sheetName);
      if (sheetData != null) {
        final inserted =
            await sheetData.values.insertRow(index + 1, userToSheetRow(user));

        // updating cache if update is successful ---------//
        if (inserted) {
          _hdb.updateCache(
              _updateUsersCache(users, user), CacheKey.ALL_USER_LIST);
        }
        // -----------------------------------------------//
        return true;
      } else {
        throw Exception("Error while fetching worksheet data");
      }
    } else {
      throw Exception("Error while fetching spreadsheet");
    }
  }

  /// Updates the cache of user information by adding or replacing the specified user.
  ///
  /// Returns the updated list of user information.
  List<UserInfo> _updateUsersCache(List<UserInfo> list, UserInfo user) {
    final index = list.indexWhere((element) => element.id == user.id);
    if (index != -1) {
      list[index] = user;
    } else {
      list.add(user);
    }
    return list;
  }
}
