import 'package:get/get.dart';

import 'package:class_link/app/modules/admin/bindings/admin_binding.dart';
import 'package:class_link/app/modules/admin/views/admin_view.dart';
import 'package:class_link/app/modules/auth/bindings/auth_binding.dart';
import 'package:class_link/app/modules/auth/views/auth_view.dart';
import 'package:class_link/app/modules/home/bindings/home_binding.dart';
import 'package:class_link/app/modules/home/views/home_view.dart';
import 'package:class_link/app/modules/user_info/bindings/user_info_binding.dart';
import 'package:class_link/app/modules/user_info/views/user_info_view.dart';
import 'package:class_link/app/services/auth_service.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL =
      Get.find<AuthService>().user == null ? Routes.AUTH : Routes.HOME;

  // static final INITIAL = Routes.USER_INFO;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFO,
      page: () => UserInfoView(),
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
    ),
  ];
}
