import 'package:get/get.dart';

import '../../../services/firebase/repository/firestore_service.dart';
import 'get_csv_file.dart';

class ImportUserSectionSection with GetFile {
  final count = Rx<int?>(null);

  Future<void> get uploadOnFirestore async {
    final data = await getFileData;
    try {
      final userSectoinList = getUserSections(data);
      for (int i = 0; i < userSectoinList.length; i++) {
        count.value = i;

        await Get.find<FirestoreService>()
            .electiveDatasources
            .importUserElectiveSection(userSectoinList[i]);
      }
      count.value = null;
    } catch (e) {
      null;
    }
  }

  void get dispose => count.close();
}
