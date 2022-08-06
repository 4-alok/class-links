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
  AuthDatasources({required this.auth,
    required this.user,
    required this.googleSignIn});

  @override
  bool get isAuthenticated => user.value != null;

  @override
  Future<UserType> get login async {
    try {
      final account = await googleSignIn.signIn();
      if (account == null) throw UserSignInFlowCancelled();

      final authentication = await account.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      await auth.signInWithCredential(credential);
      user.value = auth.currentUser;
      return userType(user.value?.email);
    } catch (e) {
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
