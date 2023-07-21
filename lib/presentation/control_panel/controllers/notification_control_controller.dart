import 'package:class_link/services/notification/fcm_helper.dart';
import 'package:get/get.dart';

class NotificationControlController {
  final title = "".obs;
  final body = "".obs;
  final reDialToWeb = false.obs;
  final reDialURL = Rx<String?>(null);

  Future<void> get createNotification async {
    FcmHelper.createFCMNotification(
        title: title.value,
        body: body.value,
        redialURL: reDialURL.value,
        route: "");
  }

  void dispose() {
    title.close();
    body.close();
    reDialToWeb.close();
    reDialURL.close();
  }
}
