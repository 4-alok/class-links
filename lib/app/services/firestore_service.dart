import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/utils/get_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'auth_service.dart';

class FirestoreService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // -----------------userInfo----------------------//
  Future<UserInfo?> checkUserExists(String userEmail) async {
    try {
      final result = await _firestore
          .collection("user")
          .limit(1)
          .where("id", isEqualTo: userEmail)
          .get();

      if (result.docs.isEmpty) {
        return null;
      } else {
        return UserInfo.fromJson(result.docs.first.data());
      }
    } catch (e) {
      Message("unable to fetch user info", e.toString());
      return null;
    }
  }

  Future<bool> addUserInfo(UserInfo user) async {
    try {
      final result = await _firestore
          .collection("user")
          .limit(1)
          .where("id", isEqualTo: Get.find<AuthService>().user!.email)
          .get();

      if (result.docs.isEmpty) {
        await _firestore.collection("user").add(user.toJson());
      } else {
        await result.docs.first.reference.delete();
        await _firestore.collection("user").add(user.toJson());
      }
      return true;
    } catch (e) {
      Message("Error", "Unable to add user : $e");
      return false;
    }
  }
}
