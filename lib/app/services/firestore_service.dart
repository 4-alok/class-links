import '../global/const/const.dart';
import '../models/time_table/time_table.dart';
import '../models/user_info/user_info.dart';
import '../utils/get_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'auth_service.dart';
import 'hive_database.dart';

class FirestoreService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final hiveDatabase = Get.find<HiveDatabase>();

  // ---------------timeTable-----------------------//
  Stream<List<Day>> get batchTimeTableStream => _firestore
      .collection("time_table")
      .where("year", isEqualTo: hiveDatabase.userInfo!.year)
      .where("slot", isEqualTo: hiveDatabase.userInfo!.slot)
      .where("batch", isEqualTo: hiveDatabase.userInfo!.batch)
      .snapshots()
      .map((event) => event.docs.isEmpty
          ? _defaultDays
          : TimeTable.fromJson(event.docs.first.data()).week);

  Future<void> addOrUpdateBatchTimeTable(TimeTable timeTable) async {
    final result = await _firestore
        .collection("time_table")
        .where("year", isEqualTo: hiveDatabase.userInfo!.year)
        .where("slot", isEqualTo: hiveDatabase.userInfo!.slot)
        .where("batch", isEqualTo: hiveDatabase.userInfo!.batch)
        .get();

    if (result.docs.isEmpty) {
      await _firestore.collection("time_table").add(timeTable.toJson());
    } else {
      await result.docs.first.reference.update(timeTable.toJson());
    }
  }

  Stream<List<Day>> get personalTimeTableStream => _firestore
      .collection("personal_time_table")
      .where("creatorId", isEqualTo: Get.find<AuthService>().user!.email!)
      .snapshots()
      .map((event) => event.docs.isEmpty
          ? _defaultDays
          : TimeTable.fromJson(event.docs.first.data()).week);

  Future<void> addOrUpdatePersonalTimeTable(TimeTable timeTable) async {
    final result = await _firestore
        .collection("personal_time_table")
        .where("creatorId", isEqualTo: Get.find<AuthService>().user!.email!)
        .get();

    if (result.docs.isEmpty) {
      await _firestore
          .collection("personal_time_table")
          .add(timeTable.toJson());
    } else {
      await result.docs.first.reference.update(timeTable.toJson());
    }
  }

  // -----------------userInfo----------------------//
  Future<UserInfo?> get getUserInfo async {
    try {
      final result = await _firestore
          .collection("user")
          .limit(1)
          .where("id", isEqualTo: Get.find<AuthService>().user!.email)
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
          .where("id", isEqualTo: Get.find<AuthService>().user!.email)
          .limit(1)
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

  // -----------------userList----------------------//
  Stream<List<UserInfo>> get userList => _firestore
      .collection("user")
      .snapshots()
      .map((event) => event.docs.isEmpty
          ? []
          : event.docs
              .map((e) => UserInfo.fromJson(e.data()).copyWith(refId: e.id))
              .toList());

  Future<bool> updateUser(UserInfo user) async {
    try {
      await _firestore.collection("user").doc(user.refId).update(user.toJson());
      return true;
    } catch (e) {
      Message("Error", "Unable to add user : $e");
      return false;
    }
  }

  // -----------------utils----------------------//
  List<Day> get _defaultDays => List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );
}
