// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:class_link/presentation/app_users/controller/app_user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../services/hive/models/user_info.dart';

class SearchData {
  final String text;
  final List<UserInfo> users;
  SearchData(this.text, this.users);
}

List<UserInfo> _getFilterList(SearchData data) => (data.text.isEmpty)
    ? []
    : data.users
        .where((e) =>
            e.userName.toLowerCase().contains(data.text) ||
            e.id.contains(data.text))
        .toList();

class UsersSearchController {
  final AppUsersController controller;
  UsersSearchController(this.controller);

  final searchTextController = TextEditingController();
  final searchPage = false.obs;

  final searchList = RxList<UserInfo>([]);

  Future updateList(String? text) async => text == null || text.isEmpty
      ? searchList.value = []
      : await compute<SearchData, List<UserInfo>>(
              _getFilterList, SearchData(text, controller.allUsersList))
          .then((value) => searchList.value = value);

  void dispose() {
    searchTextController.dispose();
    searchPage.close();
  }
}
