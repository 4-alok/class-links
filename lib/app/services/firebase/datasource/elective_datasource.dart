import 'package:class_link/app/services/hive/hive_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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
  Future<List<ElectiveTimetable>> get getUserElectiveSubjects async {
    final res = await firestore
        .collection(thirdYearSection)
        .limit(1)
        .where('rollNo', isEqualTo: await userRollNo)
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

    final elective1 = res2.docs.map((e) => ElectiveTimetable.fromMap(e.data()));
    final elective2 = res3.docs.map((e) => ElectiveTimetable.fromMap(e.data()));
    return [...elective2, ...elective1];
  }

  Future<int?> get userRollNo async => int.tryParse(
        (await Get.find<HiveDatabase>().getUserInfo)?.id.split('@').first ?? '',
      );
}
