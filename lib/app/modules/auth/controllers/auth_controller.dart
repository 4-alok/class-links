import 'package:class_link/app/routes/app_pages.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/firestore_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _authService = Get.find<AuthService>();
  final _firestoreService = Get.find<FirestoreService>();

  void login() async {
    await _authService.login();
    final userInfo = await _firestoreService.getUserInfo();

    if (userInfo == null) {
      Get.offNamed(Routes.USER_INFO);
    } else {
      Get.offNamed(Routes.HOME, arguments: [userInfo]);
    }
  }

  void logout() async {
    final s = Get.find<AuthService>();
    await s.logout();
  }

  void user() async {
    final s = Get.find<AuthService>();
    final k = s.user?.email;
    print(k);
  }
}
