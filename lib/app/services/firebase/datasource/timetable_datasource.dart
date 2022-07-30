import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/services/hive/repository/hive_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../auth/auth_service.dart';
import '../models/day_list.dart';
import '../utils/firestore_utils.dart';
import '../usecase/timetable_usecase.dart';

// ignore: constant_identifier_names
const String BATCH_TIMETABLE_KEY = 'batch_timetable';

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
        .where("year", isEqualTo: hiveDatabase.userBox.userInfo!.year)
        .where("slot", isEqualTo: hiveDatabase.userBox.userInfo!.slot)
        .where("batch", isEqualTo: hiveDatabase.userBox.userInfo!.batch)
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
  Future<void> addTimeTable(TimeTable timeTable) async =>
      await firestore.collection("time_table").add(timeTable.toJson());

  @override
  Future<List<Day>> get batchTimeTable async {
    final hiveDatabase = Get.find<HiveDatabase>();
    final res =
        await hiveDatabase.cacheBoxDataSources.getRequest(BATCH_TIMETABLE_KEY);
    if (res != null) {
      return DayList.fromMap(res).days;
    } else {
      try {
        final querySnapshot = await firestore
            .collection("time_table")
            .where("year", isEqualTo: hiveDatabase.userBox.userInfo!.year)
            .where("slot", isEqualTo: hiveDatabase.userBox.userInfo!.slot)
            .where("batch", isEqualTo: hiveDatabase.userBox.userInfo!.batch)
            .get();

        final dayList = querySnapshot.docs.isEmpty
            ? defaultDays
            : querySnapshot.docs
                .map((e) => TimeTable.fromJson(e.data()))
                .toList()
                .first
                .week;
        await hiveDatabase.cacheBoxDataSources
            .saveRequest(BATCH_TIMETABLE_KEY, DayList(days: dayList).toMap);
        return dayList;
      } catch (e) {
        return defaultDays;
      }
    }
  }

  @override
  Stream<List<Day>> get batchTimeTableStream => firestore
      .collection("time_table")
      .where("year", isEqualTo: hiveDatabase.userBox.userInfo!.year)
      .where("slot", isEqualTo: hiveDatabase.userBox.userInfo!.slot)
      .where("batch", isEqualTo: hiveDatabase.userBox.userInfo!.batch)
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
