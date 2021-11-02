import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<FirebaseApp?> app = Rx<FirebaseApp?>(null);
  @override
  void onInit() {
    super.onInit();
    Firebase.initializeApp().then((value) {
      return app.value = value;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
