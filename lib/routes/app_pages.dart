import 'package:get/get.dart';

import '../app/modules/admin/bindings/admin_binding.dart';
import '../app/modules/admin/views/admin_view.dart';
import '../app/modules/auth/bindings/auth_binding.dart';
import '../app/modules/auth/views/auth_view.dart';
import '../app/modules/holidays/holidays_view.dart';
import '../app/modules/home/bindings/home_binding.dart';
import '../app/modules/home/views/home_view.dart';
import '../app/modules/control_panel/bindings/control_panel_binding.dart';
import '../app/modules/control_panel/views/import_page.dart';
import '../app/modules/my_batch/bindings/my_batch_binding.dart';
import '../app/modules/my_batch/views/my_batch_view.dart';
import '../app/modules/profile/bindings/profile_binding.dart';
import '../app/modules/profile/views/profile_view.dart';
import '../app/modules/subject_info/views/subject_info_view.dart';
import '../app/modules/user_batch/bindings/user_batch_binding.dart';
import '../app/modules/user_batch/views/user_batch_view.dart';
import '../services/auth/repository/auth_service_repo.dart';

// ignore_for_file: non_constant_identifier_names
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL =
      Get.find<AuthService>().getUser == null ? Routes.AUTH : Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.USER_BATCH,
      page: () => const UserBatchView(),
      binding: UserBatchBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECT_INFO,
      page: () => SubjectInfoView(subjectInfo: Get.arguments),
    ),
    GetPage(
      name: _Paths.MY_BATCH,
      page: () => const MyBatchView(),
      binding: MyBatchBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.HOLIDAYS,
      page: () => const HolidaysView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.CONTROL_PANEL,
      page: () => const ControlPanel(),
      binding: ControlPanelBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
