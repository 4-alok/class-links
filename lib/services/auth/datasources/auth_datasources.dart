import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../global/utils/exceptions.dart';
import '../../../global/utils/get_snackbar.dart';
import '../../hive/repository/hive_database.dart';
import '../usecase/auth_service_usecase.dart';

class AuthDatasources implements AuthServiceUsecase {
  final FirebaseAuth auth;
  final Rx<User?> user;
  final GoogleSignIn googleSignIn;
  AuthDatasources(
      {required this.auth, required this.user, required this.googleSignIn});

  @override
  bool get isAuthenticated => user.value != null;

  @override
  Future<User?> get login async {
    try {
      final account = await googleSignIn.signIn().onError((error, stackTrace) {
        log("Error# $error ");
        log("StackTrace# $stackTrace");
        Message("Error", "Something went wrong, please try again later");
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

  @override
  Future<void> get logout async {
    await googleSignIn.signOut();
    await auth.signOut();
    await Get.find<HiveDatabase>().clearBoxes;
  }
}
