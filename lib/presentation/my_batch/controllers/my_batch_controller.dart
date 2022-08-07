import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:get/get.dart';

class MyBatchController extends GetxController {
  bool get is3rdYear =>
      Get.find<HiveDatabase>().userBoxDatasources.userInfo?.year == 3;

  bool isMe(String userName) =>
      Get.find<HiveDatabase>().userBoxDatasources.userInfo?.userName ==
      userName;
}
