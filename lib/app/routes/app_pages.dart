import 'package:get/get.dart';

import 'package:class_link/app/modules/home/bindings/home_binding.dart';
import 'package:class_link/app/modules/home/views/home_view.dart';
import 'package:class_link/app/modules/routine/bindings/routine_binding.dart';
import 'package:class_link/app/modules/routine/views/routine_view.dart';
import 'package:class_link/app/modules/servers/bindings/servers_binding.dart';
import 'package:class_link/app/modules/servers/views/servers_view.dart';
import 'package:class_link/app/modules/todo/bindings/todo_binding.dart';
import 'package:class_link/app/modules/todo/views/todo_view.dart';
import '../modules/servers/views/servers_view.dart';
import '../modules/todo/views/todo_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ROUTINE,
      page: () => RoutinePage(),
      binding: RoutineBinding(),
    ),
    GetPage(
      name: _Paths.SERVERS,
      page: () => ServerPage(),
      binding: ServersBinding(),
    ),
    GetPage(
      name: _Paths.TODO,
      page: () => AddingPage(),
      binding: TodoBinding(),
    ),
  ];
}
