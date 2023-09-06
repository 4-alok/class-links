import 'package:get/get.dart';

import '../controllers/user_batch_controller.dart';

class UserBatchBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<BatchSelectionController>(
        () => BatchSelectionController(),
      );
}
