import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../global/utils/filter_user_by_id.dart';
import '../../../global/utils/get_snackbar.dart';
import '../../auth/repository/auth_service_repo.dart';
import '../../hive/models/user_info.dart';
// import '../../hive/repository/hive_database.dart';
import '../../hive/repository/hive_database.dart';
import '../usecase/userinfo_usecase.dart';

const allStudentKey = 'all_student';

class UserInfoDatasources implements UserInfoUsecase {
  final FirebaseFirestore firestore;
  UserInfoDatasources({required this.firestore});

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  @override
  Future<bool> addUserInfo(UserInfo user) async {
    try {
      final result = await firestore
          .collection("user")
          .where("id", isEqualTo: Get.find<AuthService>().getUser!.email)
          .limit(1)
          .get();

      if (result.docs.isEmpty) {
        await firestore.collection("user").add(user.toJson());
      } else {
        await result.docs.first.reference.delete();
        await firestore.collection("user").add(user.toJson());
      }
      return true;
    } catch (e) {
      Message("Error", "Unable to add user : $e");
      return false;
    }
  }

  @override
  Future<UserInfo?> get getUserInfo async {
    try {
      final result = await firestore
          .collection("user")
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
    final userList = (await firestore
            .collection("user")
            .where("batch",
                isEqualTo:
                    hiveDatabase.userBoxDatasources.userInfo?.batch ?? "na")
            .get())
        .docs
        .map((e) => UserInfo.fromJson(e.data()))
        .toList();
    if (filterById) {
      return filterUserById(userList);
    } else {
      userList.sort((a, b) => a.userName.compareTo(b.userName));
      return userList;
    }
  }

  @override
  Stream<List<UserInfo>> get streamAllUserList =>
      firestore.collection("user").snapshots().map(
            (event) => event.docs.map((e) {
              return UserInfo.fromJson(e.data()).copyWith(refId: e.id);
            }).toList(),
          );

  @override
  Stream<List<UserInfo>> get streamUserList => firestore
      .collection("user")
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
      await firestore.collection("user").doc(user.refId).update(user.toJson());
      return true;
    } catch (e) {
      Message("Error", "Unable to add user : $e");
      return false;
    }
  }

  @override
  Future<void> deleteUser(UserInfo userInfo) async {
    final res = await firestore.collection("user").get();

    for (final snapshot in res.docs) {
      final user = UserInfo.fromJson(snapshot.data());
      if (user == userInfo) {
        await snapshot.reference.delete();
      }
    }
  }

  @override
  Future<List<UserInfo>> get getAllUserList async {
    final res =
        await hiveDatabase.cacheBoxDataSources.getRequest(allStudentKey, 1);
    if (res != null) {
      return res.entries.map((e) => UserInfo.fromJson(e.value)).toList();
    } else {
      final res = (await firestore.collection("user").get())
          .docs
          .map((e) => UserInfo.fromJson(e.data()))
          .toList();
      final map = {for (UserInfo e in res) e.id: e.toJson()};
      await hiveDatabase.cacheBoxDataSources.saveRequest(allStudentKey, map);
      return res;
    }
  }
}
