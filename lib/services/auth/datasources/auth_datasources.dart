import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../global/utils/exceptions.dart';
import '../../../global/utils/get_snackbar.dart';
import '../../hive/repository/hive_database.dart';
import '../usecase/auth_service_usecase.dart';

/// A class that implements the AuthServiceUsecase and provides the login and logout functionality
class AuthDatasources implements AuthServiceUsecase {
  final FirebaseAuth auth;
  final Rx<User?> user;
  final GoogleSignIn googleSignIn;
  AuthDatasources(
      {required this.auth, required this.user, required this.googleSignIn});

  /// This is a getter function. It is used to check if the user is authenticated or not.
  @override
  bool get isAuthenticated => user.value != null;

  /// This is the login function.
  @override
  Future<User?> get login async {
    try {
      final account = await googleSignIn.signIn().onError((error, stackTrace) {
        Message("Error", error.toString());
        throw UserSignInFlowCancelled();
      });
      if (account == null) throw UserSignInFlowCancelled();
      final authentication = await account.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      await auth.signInWithCredential(credential);
      user.value = auth.currentUser;
      return user.value;
    } catch (e) {
      log(e.toString());
      log(e.runtimeType.toString());
      Message("Error while signing in", e.toString());
      return null;
    }
  }

  /// Logging out the user from the app.
  @override
  Future<void> get logout async {
    await googleSignIn.signOut();
    await auth.signOut();
    await Get.find<HiveDatabase>().clearBoxes;
  }
}
