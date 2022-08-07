import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../presentation/home/controllers/crud_operation.dart';
import '../../hive/models/user_info.dart';
import '../repository/firestore_service.dart';

class UtilsDataSources with TimeTableCrudOperationMixin {
  final FirebaseFirestore firestore;
  final FirestoreService firestoreService;
  UtilsDataSources({required this.firestore, required this.firestoreService});

  final count = Rx<int?>(null);
  final dCount = Rx<int?>(null);
  final blakRoom = Rx<Map<String, dynamic>?>(null);

  Future<void> get all3rdYearAsViewer async {
    final res =
        await firestore.collection('user').where('year', isEqualTo: 3).get();
    for (int i = 0; i < res.docs.length; i++) {
      final userInfo = UserInfo.fromJson(res.docs[i].data());
      if (userInfo.role == 'user') {
        await firestore.collection('user').doc(res.docs[i].id).update(
            userInfo.copyWith(role: 'viewer', refId: res.docs[i].id).toJson());
      }
      count.value = i;
    }
    count.value = null;
  }

  Future<void> get delete2ndYear async {
    final res = await firestore
        .collection('time_table')
        .where('year', isEqualTo: 2020)
        .get();

    for (int i = 0; i < res.docs.length; i++) {
      await res.docs[i].reference.delete();
      dCount.value = i;
    }
    dCount.value = null;
  }

  Future<void> changeMyBatch(
      {required String myBatch, required int year}) async {
    final userInfo = Get.find<HiveDatabase>().userBox.userInfo;
    final res = await firestore
        .collection('user')
        .where('id', isEqualTo: userInfo?.id ?? '')
        .get();

    await res.docs.first.reference
        .update(userInfo!.copyWith(batch: myBatch, year: year).toJson());
  }

  /*
  Future<void> get get3rdYearBlankRoom async {
    final res = await firestore
        .collection('time_table')
        .where('year', isEqualTo: 3)
        .get();

    final list = res.docs.map((e) => TimeTable.fromJson(e.data())).toList();

    List<String> allRoomList = [];
    List<int> dayTimeList = [];

    for (final TimeTable timetable in list) {
      for (final Day day in timetable.week) {
        for (final subject in day.subjects) {
          if (!allRoomList.contains(subject.roomNo)) {
            allRoomList.add(subject.roomNo ?? '');
          }
          if (!dayTimeList.contains(subject.startTime.hour)) {
            dayTimeList.add(subject.startTime.hour);
          }
        }
      }
    }

    allRoomList.removeWhere((element) => element.isEmpty);
    allRoomList.sort((a, b) => a.compareTo(b));

    final days = List.generate(5, (index) => Days.days[index]);

    Map<String, dynamic> data = {};

    for (final day in days) {
      data[day] = {};
      for (final time in dayTimeList) {
        data[day][time] = {};
        List<String> roomList = List.from(allRoomList);
        for (final t in list) {
          final room = _getRoomNo(time, day, t);
          if (room != null) roomList.remove(room);
        }
        data[day][time] = roomList;
      }
    }

    blakRoom.value = data;
  }

  String? _getRoomNo(int time, String day, TimeTable timeTable) {
    for (final d in timeTable.week) {
      if (d.day == day) {
        for (final s in d.subjects) {
          if (s.startTime.hour == time) {
            return s.roomNo;
          }
        }
      }
    }
    return null;
  }
  */

  Future<void> get fix3rdYearUser async {}

  void get dispose {
    count.close();
    dCount.close();
    blakRoom.close();
  }
}
