import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:class_link/services/auth/models/user_type.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../global/utils/exceptions.dart';
import '../../../global/utils/get_snackbar.dart';
import '../../hive/repository/hive_database.dart';
import '../usecase/auth_service_usecase.dart';
import '../utils/filter_kiitian.dart';

class AuthDatasources with FilterKiitian implements AuthServiceUsecase {
  final FirebaseAuth auth;
  final Rx<User?> user;
  final GoogleSignIn googleSignIn;
  AuthDatasources(
      {required this.auth, required this.user, required this.googleSignIn});

  @override
  bool get isAuthenticated => user.value != null;

  @override
  Future<UserType> get login async {
    try {
      final account = await googleSignIn.signIn().onError((error, stackTrace) {
        log("Error# $error ");
        log("StackTrace# $stackTrace");
        Message(
          "Error",
          "Something went wrong, please try again later",
        );
      });
      print(0);

      if (account == null) throw UserSignInFlowCancelled();

      final authentication = await account.authentication;
      print(1);
      final credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      print(2);
      await auth.signInWithCredential(credential);
      print(3);
      user.value = auth.currentUser;
      return userType(user.value?.email);
    } catch (e) {
      log(e.toString());
      log(e.runtimeType.toString());
      Message("Error while signing in", e.toString());
      return UserType.none;
    }
  }

  UserType userType([String? email]) {
    email = auth.currentUser?.email;
    if (email == null) {
      return UserType.none;
    } else if (email.endsWith("@kiit.ac.in")) {
      final rollNo = int.tryParse(email.split("@")[0]) ?? -1;
      if (isValidRollNo(rollNo)) return UserType.user;
      return UserType.kiitian;
    } else if (FilterKiitian.exceptions(email)) {
      return UserType.user;
    } else {
      return UserType.guest;
    }
  }

  @override
  Future<void> get logout async {
    await googleSignIn.signOut();
    await auth.signOut();
    await Get.find<HiveDatabase>().clearBoxes;
  }
}
