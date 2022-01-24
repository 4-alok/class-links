import '../utils/get_snackbar.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/exceptions.dart';

class AuthService extends GetxService {
  late final FirebaseAuth _auth;
  final Rx<User?> _user = Rx<User?>(null);

  User? get user => _user.value;

  bool get isAuthenticated => _user.value != null;

  @override
  void onInit() {
    super.onInit();
    _auth = FirebaseAuth.instance;
    _user.value = _auth.currentUser;
  }

  Future<bool> login() async {
    try {
      final GoogleSignIn googleSignIn =
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
      await _auth.signInWithCredential(credential);
      _user.value = _auth.currentUser;
      return true;
    } catch (e) {
      Message("Error while signing in", e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _user.value = null;
  }
}
