import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/local_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserInfo? userInfo;

  @override
  void onInit() async {
    await getUserInfo();
    super.onInit();
  }

  Future<UserInfo?> getUserInfo() async {
    final result = await Get.find<HiveDatabase>().getUserInfo();
    if (result != null) {
      userInfo = result;
      return userInfo;
    } else {
      Get.offNamed(Routes.USER_INFO);
      return null;
    }
  }

  void signout() async {
    final s = Get.find<AuthService>();
    await s.logout();
    Get.offAllNamed(Routes.AUTH);
  }

  test() async {
    final d = Get.find<HiveDatabase>();
    final res = await d.userInfo.getAt(0);
    print(res.runtimeType);
    print(UserInfo.fromJson(res));

    //-------------------------------

    // final k = UserInfo(
    //   id: "skdfh@krjg.sef",
    //   slot: 1,
    //   batch: "B23",
    //   year: 2,
    //   date: DateTime.now(),
    // );

    // print(k.toString());
    // print(UserInfo.fromJson(k.toJson()));
  }
}
