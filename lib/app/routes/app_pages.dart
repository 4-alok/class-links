import 'package:class_link/views/servers/server_page.dart';
import 'package:get/get.dart';

import 'package:class_link/app/modules/home/bindings/home_binding.dart';
import 'package:class_link/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => ServerPage(),
      binding: HomeBinding(),
    ),
  ];
}
