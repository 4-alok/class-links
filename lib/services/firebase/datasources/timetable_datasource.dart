// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// import '../../../global/models/time_table/time_table.dart';
// import '../../auth/repository/auth_service_repo.dart';
// import '../../hive/repository/hive_database.dart';
// import '../usecase/timetable_usecase.dart';
// import '../utils/firestore_utils.dart';

// class TimetableDatasource
//     with FirestoreServiceUtils
//     implements TimetableUsecase {
//   final FirebaseFirestore firestore;
//   TimetableDatasource({required this.firestore});

//   final hiveDatabase = Get.find<HiveDatabase>();

//   String get batchTimeTableKey =>
//       'batch_timetable_${hiveDatabase.userBoxDatasources.userInfo.value?.year ?? -1}';

//   /// It adds or updates the timetable of the batch.
//   ///
//   /// Args:
//   ///   timeTable (TimeTable): The TimeTable object that you want to add or update.
//   @override
//   Future<void> addOrUpdateBatchTimeTable(TimeTable timeTable) async {
//     final result = await firestore
//         .collection(batchTimeTableKey)
//         .where("year",
//             isEqualTo: hiveDatabase.userBoxDatasources.userInfo.value!.year)
//         .where("slot",
//             isEqualTo: hiveDatabase.userBoxDatasources.userInfo.value!.slot)
//         .where("batch",
//             isEqualTo: hiveDatabase.userBoxDatasources.userInfo.value!.batch)
//         .get();

//     if (result.docs.isEmpty) {
//       await firestore.collection(batchTimeTableKey).add(timeTable.toJson());
//     } else {
//       await result.docs.first.reference.update(timeTable.toJson());
//     }
//   }

//   /// If there's no personal time table for the current user, create one, otherwise update the existing
//   /// one
//   ///
//   /// Args:
//   ///   timeTable (TimeTable): The TimeTable object that you want to add or update.
//   @override
//   Future<void> addOrUpdatePersonalTimeTable(TimeTable timeTable) async {
//     final result = await firestore
//         .collection("personal_time_table")
//         .where("creatorId", isEqualTo: Get.find<AuthService>().getUser!.email!)
//         .get();

//     if (result.docs.isEmpty) {
//       await firestore.collection("personal_time_table").add(timeTable.toJson());
//     } else {
//       await result.docs.first.reference.update(timeTable.toJson());
//     }
//   }

//   /// It adds a timetable to the database.
//   ///
//   /// Args:
//   ///   timeTable (TimeTable): The TimeTable object that you want to add to the database.
//   @override
//   Future<void> addTimeTable(TimeTable timeTable) async =>
//       await firestore.collection(batchTimeTableKey).add(timeTable.toJson());

//   // @override
//   // Future<List<Day>> get batchTimeTable async {
//   //   final res = await hiveDatabase.cacheBoxDataSources.autoCacheQuerySnapshot(
//   //     querySnapshot: firestore
//   //         .collection(batchTimeTableKey)
//   //         .where("year",
//   //             isEqualTo: hiveDatabase.userBoxDatasources.userInfo.value!.year)
//   //         .where("slot",
//   //             isEqualTo: hiveDatabase.userBoxDatasources.userInfo.value!.slot)
//   //         .where("batch",
//   //             isEqualTo: hiveDatabase.userBoxDatasources.userInfo.value!.batch)
//   //         .get,
//   //     key: batchTimeTableKey,
//   //   );
//   //   if (res.isEmpty) {
//   //     await hiveDatabase.cacheBoxDataSources.deleteRequest(batchTimeTableKey);
//   //     return defaultDays;
//   //   }
//   //   return res.map((e) => TimeTable.fromJson(e)).toList().first.week;
//   // }

//   @override
//   Stream<List<Day>> get batchTimeTableStream {
//     return firestore
//         .collection(batchTimeTableKey)
//         .where("year",
//             isEqualTo: hiveDatabase.userBoxDatasources.userInfo.value!.year)
//         .where("slot",
//             isEqualTo: hiveDatabase.userBoxDatasources.userInfo.value!.slot)
//         .where("batch",
//             isEqualTo: hiveDatabase.userBoxDatasources.userInfo.value!.batch)
//         .snapshots()
//         .map((event) => event.docs.isEmpty
//             ? defaultDays
//             : TimeTable.fromJson(event.docs.first.data()).week);
//   }

//   /// It gets all the documents from the collection, checks if the year of the timetable is the same as
//   /// the one passed in the function, and if it is, it deletes the document
//   ///
//   /// Args:
//   ///   year (int): The year of the timetable to be deleted.
//   @override
//   Future<void> deleteTimetable(int year) async {
//     final res = await firestore.collection(batchTimeTableKey).get();

//     for (final snapshot in res.docs) {
//       final timetable = TimeTable.fromJson(snapshot.data());
//       if (timetable.year == year) {
//         snapshot.reference.delete();
//       }
//     }
//   }

//   /// Getting all the timetables from the firestore.
//   @override
//   Future<List<TimeTable>> get getAllTimetable async {
//     try {
//       final res = await firestore.collection(batchTimeTableKey).get();
//       return res.docs.map((e) => TimeTable.fromJson(e.data())).toList();
//     } catch (e) {
//       return [];
//     }
//   }

//   @override
//   Future<List<Day>> get personalTimeTable async {
//     try {
//       final querySnapshot = await firestore
//           .collection("personal_time_table")
//           .where("creatorId",
//               isEqualTo: Get.find<AuthService>().getUser!.email!)
//           .get();

//       return querySnapshot.docs.isEmpty
//           ? defaultDays
//           : querySnapshot.docs
//               .map((e) => TimeTable.fromJson(e.data()))
//               .toList()
//               .first
//               .week;
//     } catch (e) {
//       return defaultDays;
//     }
//   }

//   /// A getter that returns a stream of list of days.
//   @override
//   Stream<List<Day>> get personalTimeTableStream => firestore
//       .collection("personal_time_table")
//       .where("creatorId", isEqualTo: Get.find<AuthService>().getUser!.email!)
//       .snapshots()
//       .map((event) => event.docs.isEmpty
//           ? defaultDays
//           : TimeTable.fromJson(event.docs.first.data()).week);
// }
