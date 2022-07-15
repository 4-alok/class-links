import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/elective_timetable.dart';
import '../models/user_section.dart';
import '../usecase/elective_usecase.dart';

class ElectiveDatasources implements ElectiveUsecase {
  final FirebaseFirestore firestore;
  ElectiveDatasources({required this.firestore});

  @override
  Future<void> importElectiveTimetable(
      List<ElectiveTimetable> electiveTimetables) async {
    for (final electiveTimetable in electiveTimetables) {
      await firestore
          .collection('3rd_year_elective_timetable')
          .add(electiveTimetable.toMap());
    }
  }

  @override
  Future<void> importUserElectiveSection(
      List<UserSecetion> userSections) async {
    for (final userSection in userSections) {
      await firestore.collection('3rd_year_section').add(userSection.toMap());
    }
  }
}
