import 'package:class_link/global/utils/get_snackbar.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/user_elective_section.dart';

const String userElectiveSection = 'user_elective_section';
const String thirdYearSection = '3rd_year_section';
const String thirdYeatElectiveTimetable = '3rd_year_elective_timetable';

class ElectiveDatasources {
  final FirebaseFirestore firestore;
  ElectiveDatasources({required this.firestore});

  Future<UserElectiveSection?> getUserElectiveSection() async {
    try {
      final email = Get.find<HiveDatabase>().userBoxDatasources.userInfo?.id;
      final rollNo = email?.substring(0, email.indexOf('@'));

      final res = await firestore
          .collection(userElectiveSection)
          .where("rollNo", isEqualTo: rollNo)
          .limit(1)
          .get();

      if (res.docs.isEmpty) {
        return null;
      }

      return UserElectiveSection.fromMap(res.docs.first.data());
    } catch (e) {
      Message("Error", e.toString());
      return null;
    }
  }

  Future<void> addUserElectiveSection(UserElectiveSection section) async {
    // await hiveDatabase.cacheBoxDataSources
    //     .saveRequest(userElectiveSection, section.toMap());
    await firestore.collection(userElectiveSection).add(section.toMap());
  }
}
