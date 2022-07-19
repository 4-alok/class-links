import 'package:get/get.dart';

import '../../../services/firebase/repository/firestore_service.dart';
import 'get_csv_file.dart';

class Import3YearElectiveTimetable with GetFile {
  final count = Rx<int?>(null);

  Future<void> get uploadOnFirestore async {
    final data = await getFileData;
    final electiveTimetables = getElectiveTimetable(data);

    for (int i = 0; i < electiveTimetables.length; i++) {
      count.value = i;
      await Get.find<FirestoreService>()
          .electiveDatasources
          .importElectiveTimetable(electiveTimetables[i]);
    }
    count.value = null;
  }

  void get dispose => count.close();
}
