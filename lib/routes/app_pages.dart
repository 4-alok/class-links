import 'package:get/get.dart';

import '../presentation/app_users/binding/app_user_binding.dart';
import '../presentation/app_users/view/app_user_view.dart';
import '../presentation/auth/bindings/auth_binding.dart';
import '../presentation/auth/views/auth_view.dart';
// import '../presentation/batch_selection/bindings/user_batch_binding.dart';
// import '../presentation/batch_selection/views/user_batch_view.dart';
import '../presentation/control_panel/bindings/control_panel_binding.dart';
import '../presentation/control_panel/views/control_panel_view.dart';
import '../presentation/control_panel/views/pages/notification_page.dart';
import '../presentation/control_panel/views/pages/reports_page.dart';
import '../presentation/holidays/bindings/holiday_bindings.dart';
import '../presentation/holidays/views/holidays_view.dart';
import '../presentation/home/bindings/home_binding.dart';
import '../presentation/home/views/home_view.dart';
import '../presentation/my_batch/bindings/my_batch_binding.dart';
import '../presentation/my_batch/views/my_batch_view.dart';
import '../presentation/non_kiitian/non_kiitian_view.dart';
import '../presentation/profile/bindings/profile_binding.dart';
import '../presentation/profile/views/profile_view.dart';
import '../presentation/report/binding/report_binding.dart';
import '../presentation/report/view/report_view.dart';
import '../presentation/resources/bindings/resources_binding.dart';
import '../presentation/resources/view/resources_view.dart';
import '../presentation/subject_info/views/subject_info_view.dart';
import '../presentation/test_page/views/test_page.dart';
import '../services/hive/repository/hive_database.dart';

// import '../services/auth/repository/auth_service_repo.dart';

// ignore_for_file: non_constant_identifier_names
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL =
      Get.find<HiveDatabase>().userBoxDatasources.userInfo.value == null
          ? Routes.AUTH
          : Get.find<HiveDatabase>().userBoxDatasources.userInfo.value == null
              ? Routes.AUTH
              : Routes.HOME;

  // static const INITIAL = Routes.TEST;

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
      page: () => const AppUserView(),
      binding: AppUsersBindings(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    // GetPage(
    //   name: _Paths.BATCH_SELECTION,
    //   page: () => const BatchSelectionPage(),
    //   binding: UserBatchBinding(),
    // ),
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
      binding: HolidayBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.CONTROL_PANEL,
      page: () => const ControlPanel(),
      binding: ControlPanelBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.ADMIN_REPORT_PAGE,
      page: () => const AdminReportsPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.REPORT,
      binding: ReportBinding(),
      page: () => const ReportView(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_CONTROL,
      page: () => const NotificationControlPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => const TestPage(),
    ),
    GetPage(
      name: _Paths.NON_KIITIAN,
      page: () => const NonKiitianView(),
    ),
    GetPage(
      name: _Paths.RESOURCES,
      binding: ResourcesBinding(),
      page: () => const ResourcesView(),
    ),
  ];
}
