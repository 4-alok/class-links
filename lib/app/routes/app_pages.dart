import 'package:class_link/app/modules/import_timetable/views/import_page.dart';
import 'package:get/get.dart';

import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/holidays/holidays_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/import_timetable/bindings/import_binding.dart';
import '../modules/log_page/log_page_view.dart';
import '../modules/my_batch/bindings/my_batch_binding.dart';
import '../modules/my_batch/views/my_batch_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/subject_info/views/subject_info_view.dart';
import '../modules/user_batch/bindings/user_batch_binding.dart';
import '../modules/user_batch/views/user_batch_view.dart';
import '../services/auth/auth_service.dart';

// ignore_for_file: non_constant_identifier_names
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL =
      Get.find<AuthService>().user == null ? Routes.AUTH : Routes.HOME;

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
      name: _Paths.LOG_PAGE,
      page: () => const LogPageView(),
      transition: Transition.cupertino,
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
      name: _Paths.IMPORT,
      page: () => const ImportPage(),
      binding: ImportBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
