import 'package:class_link/app/global/const/const.dart';
// import 'package:class_link/app/models/batch/batch.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/models/user_info/user_info.dart';
import 'package:class_link/app/utils/get_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'auth_service.dart';
import 'hive_database.dart';

class FirestoreService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final hiveDatabase = Get.find<HiveDatabase>();

  // ---------------batch-----------------//
  // Future<bool> addBatch(BatchYear batch) async {
  //   try {
  //     await _firestore.collection('batches').add(batch.toJson());
  //     return true;
  //   } catch (e) {
  //     Message("Error", e.toString());
  //     return false;
  //   }
  // }

  // Future<bool> removeBatch(BatchYear batch) async {
  //   // final ref = _firestore.collection('batches')
  //   // .where("forYear", isEqualTo: batch.forYear)
  //   return false;
  // }

  // Future<void> getBatchList() async {}

  // ---------------timeTable-----------------------//
  Stream<List<Day>> timeTableStream() {
    final _ref = _firestore
        .collection("time_table")
        .where("year", isEqualTo: hiveDatabase.userInfo!.year)
        .where("slot", isEqualTo: hiveDatabase.userInfo!.slot)
        .where("batch", isEqualTo: hiveDatabase.userInfo!.batch)
        .snapshots();
    return _ref.map((event) => event.docs.isEmpty
        ? _defaultDays
        : TimeTable.fromJson(event.docs.first.data()).week);
  }

  Future<void> addOrUpdateTimeTable(TimeTable timeTable) async {
    // if (hiveDatabase.userInfo!.year == 1) {
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

  // -----------------userInfo----------------------//
  Future<UserInfo?> getUserInfo() async {
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

  // -----------------utils----------------------//
  List<Day> get _defaultDays => List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );
}
