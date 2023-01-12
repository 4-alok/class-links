import 'package:class_link/services/gsheet/repository/gsheet_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../global/utils/filter_user_by_id.dart';
import '../../../global/utils/get_snackbar.dart';
import '../../auth/repository/auth_service_repo.dart';
import '../../hive/models/user_info.dart';
import '../../hive/repository/hive_database.dart';
import '../usecase/userinfo_usecase.dart';

const allStudentKey = 'all_student';
const myBatchKey = 'my_batch';
const userCollectionKey = 'userv2';

class UserInfoDatasources implements UserInfoUsecase {
  final FirebaseFirestore firestore;
  UserInfoDatasources({required this.firestore});

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  @override
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
        await firestore.collection(userCollectionKey).add(user.toJson());
      } else {
        await result.docs.first.reference.delete();
        await firestore.collection(userCollectionKey).add(user.toJson());
      }
      return true;
    } catch (e) {
      Message("Error", "Unable to add user : $e");
      return false;
    }
  }

  @override
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

  @override
  Future<UserInfo?> get getUserInfo async {
    try {
      final result = await firestore
          .collection(userCollectionKey)
          .limit(1)
          .where("id", isEqualTo: Get.find<AuthService>().getUser!.email)
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

  @override
  Future<List<UserInfo>> myBatch([bool filterById = true]) async {
    final res = await hiveDatabase.cacheBoxDataSources.autoCacheQuerySnapshot(
      querySnapshot: firestore
          .collection(userCollectionKey)
          .where("batch",
              isEqualTo:
                  hiveDatabase.userBoxDatasources.userInfo?.batch ?? "na")
          .get,
      key: myBatchKey,
    );
    final userList = res.map((e) => UserInfo.fromJson(e)).toList();
    if (filterById) {
      return filterUserById(userList);
    } else {
      userList.sort((a, b) => a.userName.compareTo(b.userName));
      return userList;
    }
  }

  @override
  Stream<List<UserInfo>> get streamAllUserList =>
      firestore.collection(userCollectionKey).snapshots().map(
            (event) => event.docs.map((e) {
              return UserInfo.fromJson(e.data()).copyWith(refId: e.id);
            }).toList(),
          );

  @override
  Stream<List<UserInfo>> get streamUserList => firestore
      .collection(userCollectionKey)
      .where("batch",
          isEqualTo: hiveDatabase.userBoxDatasources.userInfo?.batch ?? "na")
      .snapshots()
      .map(
        (event) => event.docs.map((e) {
          return UserInfo.fromJson(e.data()).copyWith(refId: e.id);
        }).toList(),
      );

  @override
  Future<bool> updateUser(UserInfo user) async {
    try {
      await firestore
          .collection(userCollectionKey)
          .doc(user.refId)
          .update(user.toJson());
      return true;
    } catch (e) {
      Message("Error", "Unable to add user : $e");
      return false;
    }
  }

  @override
  Future<void> deleteUser(UserInfo userInfo) async {
    final res = await firestore.collection(userCollectionKey).get();
    for (final snapshot in res.docs) {
      final user = UserInfo.fromJson(snapshot.data());
      if (user == userInfo) {
        await snapshot.reference.delete();
      }
    }
  }

  @override
  Future<List<UserInfo>> get getAllUserList async {
    final res = await hiveDatabase.cacheBoxDataSources.autoCacheQuerySnapshot(
      querySnapshot: firestore.collection(userCollectionKey).get,
      key: allStudentKey,
    );
    return res.map((e) => UserInfo.fromJson(e)).toList();
  }
}
