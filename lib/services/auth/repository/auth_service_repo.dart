import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../datasources/auth_datasources.dart';
import '../usecase/auth_service_usecase.dart';

/// It's a service class that implements the AuthServiceUsecase interface and uses the AuthDatasources
/// class to perform the login and logout operations
class AuthService extends GetxService implements AuthServiceUsecase {
  late final FirebaseAuth auth;
  late final AuthDatasources authDatasources;
  final Rx<User?> user = Rx<User?>(null);
  final GoogleSignIn googleSignIn = GoogleSignIn();

  /// > We're initializing the `auth` and `user` variables, and then we're creating an instance of the
  /// `AuthDatasources` class, which is where we'll be putting all of our authentication logic
  @override
  void onInit() {
    auth = FirebaseAuth.instance;
    user.value = auth.currentUser;
    authDatasources =
        AuthDatasources(auth: auth, user: user, googleSignIn: googleSignIn);
    super.onInit();
  }

  /// It's a getter that returns the current user.
  User? get getUser => user.value;

  @override
  bool get isAuthenticated => authDatasources.isAuthenticated;

  /// It's a getter that returns the current user.
  @override
  Future<User?> get login async => await authDatasources.login;

  @override
  Future<void> get logout async {
    await authDatasources.logout;
    user.value = null;
  }
}
