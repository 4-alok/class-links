import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/services/hive/hive_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../auth/auth_service.dart';
import '../utils/firestore_utils.dart';
import '../usecase/timetable_usecase.dart';

class TimetableDatasource
    with FirestoreServiceUtils
    implements TimetableUsecase {
  final FirebaseFirestore firestore;
  TimetableDatasource({required this.firestore});

  final hiveDatabase = Get.find<HiveDatabase>();

  @override
  Future<void> addOrUpdateBatchTimeTable(TimeTable timeTable) async {
    final result = await firestore
        .collection("time_table")
        .where("year", isEqualTo: hiveDatabase.userInfo!.year)
        .where("slot", isEqualTo: hiveDatabase.userInfo!.slot)
        .where("batch", isEqualTo: hiveDatabase.userInfo!.batch)
        .get();

    if (result.docs.isEmpty) {
      await firestore.collection("time_table").add(timeTable.toJson());
    } else {
      await result.docs.first.reference.update(timeTable.toJson());
    }
  }

  @override
  Future<void> addOrUpdatePersonalTimeTable(TimeTable timeTable) async {
    final result = await firestore
        .collection("personal_time_table")
        .where("creatorId", isEqualTo: Get.find<AuthService>().user!.email!)
        .get();

    if (result.docs.isEmpty) {
      await firestore.collection("personal_time_table").add(timeTable.toJson());
    } else {
      await result.docs.first.reference.update(timeTable.toJson());
    }
  }

  @override
  Future<void> addTimeTables(List<TimeTable> timeTables) async {
    for (final timeTable in timeTables) {
      await firestore.collection("time_table").add(timeTable.toJson());
    }
  }

  @override
  Future<List<Day>> get batchTimeTable async {
    try {
      final querySnapshot = await firestore
          .collection("time_table")
          .where("year", isEqualTo: hiveDatabase.userInfo!.year)
          .where("slot", isEqualTo: hiveDatabase.userInfo!.slot)
          .where("batch", isEqualTo: hiveDatabase.userInfo!.batch)
          .get();

      return querySnapshot.docs.isEmpty
          ? defaultDays
          : querySnapshot.docs
              .map((e) => TimeTable.fromJson(e.data()))
              .toList()
              .first
              .week;
    } catch (e) {
      return defaultDays;
    }
  }

  @override
  Stream<List<Day>> get batchTimeTableStream => firestore
      .collection("time_table")
      .where("year", isEqualTo: hiveDatabase.userInfo!.year)
      .where("slot", isEqualTo: hiveDatabase.userInfo!.slot)
      .where("batch", isEqualTo: hiveDatabase.userInfo!.batch)
      .snapshots()
      .map((event) => event.docs.isEmpty
          ? defaultDays
          : TimeTable.fromJson(event.docs.first.data()).week);

  @override
  Future<void> deleteTimetable(int year) async {
    final res = await firestore.collection("time_table").get();

    for (final snapshot in res.docs) {
      final timetable = TimeTable.fromJson(snapshot.data());
      if (timetable.year == year) {
        snapshot.reference.delete();
      }
    }
  }

  @override
  Future<List<TimeTable>> get getAllTimetable async {
    try {
      final res = await firestore.collection("time_table").get();
      return res.docs.map((e) => TimeTable.fromJson(e.data())).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Day>> get personalTimeTable async {
    try {
      final querySnapshot = await firestore
          .collection("personal_time_table")
          .where("creatorId", isEqualTo: Get.find<AuthService>().user!.email!)
          .get();

      return querySnapshot.docs.isEmpty
          ? defaultDays
          : querySnapshot.docs
              .map((e) => TimeTable.fromJson(e.data()))
              .toList()
              .first
              .week;
    } catch (e) {
      return defaultDays;
    }
  }

  @override
  Stream<List<Day>> get personalTimeTableStream => firestore
      .collection("personal_time_table")
      .where("creatorId", isEqualTo: Get.find<AuthService>().user!.email!)
      .snapshots()
      .map((event) => event.docs.isEmpty
          ? defaultDays
          : TimeTable.fromJson(event.docs.first.data()).week);
}
