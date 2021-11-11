import 'package:class_link/app/utils/exceptions.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  late FirebaseAuth _auth;
  Rx<User?> _user = Rx<User?>(null);

  User? get user => _user.value;

  bool get isAuthenticated => _user.value != null;

  @override
  void onInit() {
    super.onInit();
    _auth = FirebaseAuth.instance;
    _user.value = _auth.currentUser;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> login() async {
    GoogleSignIn googleSignIn =
        GoogleSignIn(scopes: ['profile'], hostedDomain: 'kiit.ac.in');
    final account = await googleSignIn.signIn();
    if (account == null) {
      throw UserSignInFlowCancelled();
    }
    final creds = await account.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: creds.accessToken,
      idToken: creds.idToken,
    );
    _auth.signInWithCredential(credential);
    _user.value = _auth.currentUser;
  }

  Future<void> logout() {
    _user.value = null;
    return _auth.signOut();
  }
}
