import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../datasources/auth_datasources.dart';
import '../usecase/auth_service_usecase.dart';

class AuthService extends GetxService implements AuthServiceUsecase {
  late final FirebaseAuth auth;
  late final AuthDatasources authDatasources;
  final Rx<User?> user = Rx<User?>(null);
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    auth = FirebaseAuth.instance;
    user.value = auth.currentUser;
    authDatasources =
        AuthDatasources(auth: auth, user: user, googleSignIn: googleSignIn);
    super.onInit();
  }

  User? get getUser => user.value;

  @override
  bool get isAuthenticated => authDatasources.isAuthenticated;

  @override
  Future<User?> get login async => await authDatasources.login;

  @override
  Future<void> get logout async {
    await authDatasources.logout.then((_) => user.value = null);
  }
}
