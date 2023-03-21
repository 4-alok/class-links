import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:get/get.dart';

/// > A class that contains methods that are used to determine if the user is in the 3rd year or if the
/// user is viewing his/her own profile
class MyBatchController extends GetxController {
  /// A getter that returns true if the user is in the 3rd year.
  bool get is3rdYear =>
      Get.find<HiveDatabase>().userBoxDatasources.userInfo?.year == 3;

  /// > If the userName of the current user is the same as the userName of the user whose profile is being
  /// viewed, then return true
  ///
  /// Args:
  ///   userName (String): The user name of the user whose profile you want to open.
  bool isMe(String userName) =>
      Get.find<HiveDatabase>().userBoxDatasources.userInfo?.userName ==
      userName;
}
