import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../app/models/time_table/time_table.dart';
import '../../auth/repository/auth_service_repo.dart';
import '../../hive/repository/hive_database.dart';
import '../models/day_list.dart';
import '../usecase/timetable_usecase.dart';
import '../utils/firestore_utils.dart';

// const String batchTimeTableKey = 'batch_timetable';

class TimetableDatasource
    with FirestoreServiceUtils
    implements TimetableUsecase {
  final FirebaseFirestore firestore;
  TimetableDatasource({required this.firestore});

  final hiveDatabase = Get.find<HiveDatabase>();

  String get batchTimeTableKey =>
      'batch_timetable_${hiveDatabase.userBox.userInfo?.year ?? -1}';

  @override
  Future<void> addOrUpdateBatchTimeTable(TimeTable timeTable) async {
    final result = await firestore
        .collection(batchTimeTableKey)
        .where("year", isEqualTo: hiveDatabase.userBox.userInfo!.year)
        .where("slot", isEqualTo: hiveDatabase.userBox.userInfo!.slot)
        .where("batch", isEqualTo: hiveDatabase.userBox.userInfo!.batch)
        .get();

    if (result.docs.isEmpty) {
      await firestore.collection(batchTimeTableKey).add(timeTable.toJson());
    } else {
      await result.docs.first.reference.update(timeTable.toJson());
    }
  }

  @override
  Future<void> addOrUpdatePersonalTimeTable(TimeTable timeTable) async {
    final result = await firestore
        .collection("personal_time_table")
        .where("creatorId", isEqualTo: Get.find<AuthService>().getUser!.email!)
        .get();

    if (result.docs.isEmpty) {
      await firestore.collection("personal_time_table").add(timeTable.toJson());
    } else {
      await result.docs.first.reference.update(timeTable.toJson());
    }
  }

  @override
  Future<void> addTimeTable(TimeTable timeTable) async =>
      await firestore.collection(batchTimeTableKey).add(timeTable.toJson());

  @override
  Future<List<Day>> get batchTimeTable async {
    final hiveDatabase = Get.find<HiveDatabase>();
    final res =
        await hiveDatabase.cacheBoxDataSources.getRequest(batchTimeTableKey);
    if (res != null) {
      return DayList.fromMap(res).days;
    } else {
      try {
        final querySnapshot = await firestore
            .collection(batchTimeTableKey)
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
            .saveRequest(batchTimeTableKey, DayList(days: dayList).toMap);
        return dayList;
      } catch (e) {
        return defaultDays;
      }
    }
  }

  @override
  Stream<List<Day>> get batchTimeTableStream => firestore
      .collection(batchTimeTableKey)
      .where("year", isEqualTo: hiveDatabase.userBox.userInfo!.year)
      .where("slot", isEqualTo: hiveDatabase.userBox.userInfo!.slot)
      .where("batch", isEqualTo: hiveDatabase.userBox.userInfo!.batch)
      .snapshots()
      .map((event) => event.docs.isEmpty
          ? defaultDays
          : TimeTable.fromJson(event.docs.first.data()).week);

  @override
  Future<void> deleteTimetable(int year) async {
    final res = await firestore.collection(batchTimeTableKey).get();

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
      final res = await firestore.collection(batchTimeTableKey).get();
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
          .where("creatorId",
              isEqualTo: Get.find<AuthService>().getUser!.email!)
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
      .where("creatorId", isEqualTo: Get.find<AuthService>().getUser!.email!)
      .snapshots()
      .map((event) => event.docs.isEmpty
          ? defaultDays
          : TimeTable.fromJson(event.docs.first.data()).week);
}
