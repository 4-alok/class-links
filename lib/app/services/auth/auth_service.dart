import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/exceptions.dart';
import '../../utils/extension.dart';
import '../../utils/get_snackbar.dart';

enum UserType { user, kiitian, guest, none }

class AuthService extends GetxService {
  late final FirebaseAuth _auth;
  final Rx<User?> _user = Rx<User?>(null);
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get user => _user.value;

  bool get isAuthenticated => _user.value != null;

  @override
  void onInit() {
    super.onInit();
    _auth = FirebaseAuth.instance;
    _user.value = _auth.currentUser;
  }

  Future<UserType> get login async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        throw UserSignInFlowCancelled();
      }
      final authentication = await account.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      await _auth.signInWithCredential(credential);
      _user.value = _auth.currentUser;
      return userType(_user.value?.email);
    } catch (e) {
      Message("Error while signing in", e.toString());
      return UserType.none;
    }
  }

  UserType userType([String? email]) {
    email = _auth.currentUser?.email;
    if (email == null) {
      return UserType.none;
    } else if (email.endsWith("@kiit.ac.in")) {
      final rollNo = int.tryParse(email.split("@")[0]) ?? -1;
      if (rollNo.isBetween(2005000, 2005999) ||
          rollNo.isBetween(20051000, 20052010) ||
          rollNo.isBetween(2105000, 2105999) ||
          rollNo.isBetween(21051000, 21053467) ||
          rollNo.isBetween(2006001, 2006568)) {
        return UserType.user;
      }
      return UserType.kiitian;
    } else {
      return UserType.guest;
    }
  }

  Future<void> get logout async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    _user.value = null;
  }
}
