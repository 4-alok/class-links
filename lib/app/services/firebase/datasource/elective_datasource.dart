import 'package:class_link/app/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../hive/utils/local_database.dart';
import '../models/elective_timetable.dart';
import '../models/user_section.dart';
import '../usecase/elective_usecase.dart';

const thirdYearSection = '3rd_year_section';
const thirdYeatElectiveTimetable = '3rd_year_elective_timetable';

class ElectiveDatasources implements ElectiveUsecase {
  final FirebaseFirestore firestore;
  ElectiveDatasources({required this.firestore});

  @override
  Future<void> importElectiveTimetable(
          ElectiveTimetable electiveTimetable) async =>
      await firestore
          .collection(thirdYeatElectiveTimetable)
          .add(electiveTimetable.toMap());

  @override
  Future<void> importUserElectiveSection(UserSecetion userSection) async =>
      await firestore.collection(thirdYearSection).add(userSection.toMap());

  @override
  Future<List<ElectiveTimetable>> getUserElectiveSubjects(
      {required bool local}) async {
    if (local) {
      final userSection = await getUserSection(local: local);
      if (userSection != null) {
        final electiveTimetables =
            await LocalDatabase().getLocalElectiveTimetable;
        final res1 = electiveTimetables
            .where((e) => e.section == userSection.elective1Section)
            .toList();
        final res2 = electiveTimetables
            .where((e) => e.section == userSection.elective2Section)
            .toList();
        return [...res1, ...res2];
      } else {
        return [];
      }
    } else {
      final res = await firestore
          .collection(thirdYearSection)
          .limit(1)
          .where('rollNo', isEqualTo: userRollNo)
          .get();

      final userSecetion = UserSecetion.fromMap(res.docs.first.data());

      final res2 = await firestore
          .collection(thirdYeatElectiveTimetable)
          .where('section', isEqualTo: userSecetion.elective1Section)
          .get();

      final res3 = await firestore
          .collection(thirdYeatElectiveTimetable)
          .where('section', isEqualTo: userSecetion.elective2Section)
          .get();

      final elective1 =
          res2.docs.map((e) => ElectiveTimetable.fromMap(e.data()));
      final elective2 =
          res3.docs.map((e) => ElectiveTimetable.fromMap(e.data()));
      return [...elective2, ...elective1];
    }
  }

  int? get userRollNo => int.tryParse(
        (Get.find<AuthService>().user)?.email?.split('@').first ?? '',
      );

  @override
  Future<UserSecetion?> getUserSection({required bool local}) async {
    if (local) {
      final sections = await LocalDatabase().getLocalUserSection;
      final userSection = sections.where((e) => e.rollNo == userRollNo);
      return userSection.isNotEmpty ? userSection.first : null;
    } else {
      try {
        final res = await firestore
            .collection(thirdYearSection)
            .limit(1)
            .where('rollNo', isEqualTo: userRollNo)
            .get();
        return UserSecetion.fromMap(res.docs.first.data());
      } catch (e) {
        return null;
      }
    }
  }
}
