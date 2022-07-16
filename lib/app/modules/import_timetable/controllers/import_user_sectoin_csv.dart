import 'package:get/get.dart';

import '../../../services/firebase/models/user_section.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import 'get_csv_file.dart';

class ImportUserSectionSection with GetFile {
  final uploading = RxBool(false);

  Future<void> get importCsv async {
    final data = await getFileData;
    uploading.value = true;
    try {
      final userSectoinList = data
          .map((e) => UserSecetion(
                rollNo: e[0],
                name: e[1],
                section: e[2],
                elective1Section: e[3],
                elective2Section: e[4],
              ))
          .toList();

      await Get.find<FirestoreService>()
          .electiveDatasources
          .importUserElectiveSection(userSectoinList);
    } catch (e) {
      null;
    }
    uploading.value = false;
  }

  void get dispose {
    uploading.close();
  }
}
