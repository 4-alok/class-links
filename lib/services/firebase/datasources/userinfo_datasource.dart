import '../../gsheet/repository/gsheet_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../global/utils/get_snackbar.dart';
import '../../auth/repository/auth_service_repo.dart';
import '../../hive/models/user_info.dart';
import '../../hive/repository/hive_database.dart';

const allStudentKey = 'all_student';
const myBatchKey = 'my_batch';
const userCollectionKey = 'users_v4';

class UserInfoDatasources {
  final FirebaseFirestore firestore;
  UserInfoDatasources({required this.firestore});

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  Future<bool> addUserInfo(UserInfo user) async {
    try {
      final result = await firestore
          .collection(userCollectionKey)
          .where("id", isEqualTo: Get.find<AuthService>().getUser!.email)
          .limit(1)
          .get();

      if (result.docs.isEmpty) {
        await Get.find<GSheetService>()
            .gSheetUserInfoDatasources
            .addUserInfo(user);
        await firestore.collection(userCollectionKey).add(user.toMap());
      } else {
        await result.docs.first.reference.delete();
        await firestore.collection(userCollectionKey).add(user.toMap());
      }
      return true;
    } catch (e) {
      Message("Error", "Unable to add user : $e");
      return false;
    }
  }

  Future<void> resetUser(String userId) async {
    try {
      await firestore
          .collection(userCollectionKey)
          .where('id', isEqualTo: userId)
          .limit(1)
          .get()
          .then((value) => value.docs.first.reference.delete());
      Message("Success", "User reset successfully");
    } catch (e) {
      Message("Error", "Unable to reset user : $e");
    }

    try {
      await firestore
          .collection("user_elective_section")
          .where("rollNo", isEqualTo: int.tryParse(userId.split("@").first))
          .limit(1)
          .get()
          .then((value) => value.docs.first.reference.delete());
      Message("Success", "User elective section reset successfully");
    } catch (e) {
      Message('Error', 'Unable to reset user elective section : $e');
    }
  }

  Future<UserInfo?> getUserInfo() async {
    try {
      final result = await firestore
          .collection(userCollectionKey)
          .limit(1)
          .where("id", isEqualTo: Get.find<AuthService>().getUser!.email)
          .get();

      if (result.docs.isEmpty) {
        return null;
      } else {
        return UserInfo.fromMap(result.docs.first.data());
      }
    } catch (e) {
      Message("unable to fetch user info", e.toString());
      return null;
    }
  }

  Future<UserInfoList> myBatch() async => UserInfoList(
      list: (await firestore
              .collection(userCollectionKey)
              .where("batch",
                  isEqualTo:
                      hiveDatabase.userBoxDatasources.userInfo.value?.batch ??
                          "na")
              .where('semester',
                  isEqualTo:
                      hiveDatabase.userBoxDatasources.userInfo.value?.semester)
              .limit(100)
              .get())
          .docs
          .map((e) => UserInfo.fromMap(e.data()).copyWith(refId: e.id))
          .toList());

  Stream<List<UserInfo>> get streamAllUserList =>
      firestore.collection(userCollectionKey).snapshots().map(
            (event) => event.docs.map((e) {
              return UserInfo.fromMap(e.data()).copyWith(refId: e.id);
            }).toList(),
          );

  Stream<List<UserInfo>> get streamUserList => firestore
      .collection(userCollectionKey)
      .where("batch",
          isEqualTo:
              hiveDatabase.userBoxDatasources.userInfo.value?.batch ?? "na")
      .snapshots()
      .map(
        (event) => event.docs.map((e) {
          return UserInfo.fromMap(e.data()).copyWith(refId: e.id);
        }).toList(),
      );

  Future<bool> updateUserInfo(UserInfo user) async {
    try {
      await firestore
          .collection(userCollectionKey)
          .doc(user.refId)
          .update(user.toMap());
      return true;
    } catch (e) {
      Message("Error", "Unable to add user : $e");
      return false;
    }
  }

  Future<void> deleteUser(UserInfo userInfo) async {
    final res = await firestore.collection(userCollectionKey).get();
    for (final snapshot in res.docs) {
      final user = UserInfo.fromMap(snapshot.data());
      if (user == userInfo) {
        await snapshot.reference.delete();
      }
    }
  }

  Future<List<UserInfo>> get getAllUserList async {
    // final res = await hiveDatabase.cacheBoxDataSources.autoCacheQuerySnapshot(
    //   querySnapshot: firestore.collection(userCollectionKey).get,
    //   key: allStudentKey,
    // );
    // return res.map((e) => UserInfo.fromMap(e)).toList();
    return [];
  }
}
