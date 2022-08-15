import 'package:get/get.dart';

import '../controller/app_user_controller.dart';

class AppUsersBindings extends Bindings {
  @override
  void dependencies() => Get.lazyPut<AppUsersController>(
        () => AppUsersController(),
      );
}
