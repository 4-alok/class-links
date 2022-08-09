import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../datasource/elective_datasource.dart';
import '../datasource/report_datasources.dart';
import '../datasource/timetable_datasource.dart';
import '../datasource/userinfo_datasource.dart';
import '../datasource/utils_datasources.dart';
import '../utils/firestore_utils.dart';

class FirestoreService extends GetxService with FirestoreServiceUtils {
  late final FirebaseFirestore _firestore;
  late final TimetableDatasource timetableDatasource;
  late final UserInfoDatasources userInfoDatasources;
  late final ElectiveDatasources electiveDatasources;
  late final ReportDatasources reportDatasources;
  late final UtilsDataSources utilsDataSources;

  @override
  void onInit() {
    _firestore = FirebaseFirestore.instance;
    timetableDatasource = TimetableDatasource(firestore: _firestore);
    userInfoDatasources = UserInfoDatasources(firestore: _firestore);
    electiveDatasources = ElectiveDatasources(firestore: _firestore);
    reportDatasources = ReportDatasources(firestore: _firestore);
    utilsDataSources =
        UtilsDataSources(firestore: _firestore, firestoreService: this);
    super.onInit();
  }

  @override
  void onClose() {
    utilsDataSources.dispose;
    super.onClose();
  }
}
