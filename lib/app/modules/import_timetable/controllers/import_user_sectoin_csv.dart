import 'package:get/get.dart';

import '../../../services/firebase/models/user_section.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import 'get_csv_file.dart';

class ImportUserSectionSection with GetFile {
  final count = Rx<int?>(null);

  Future<void> get importCsv async {
    final data = await getFileData;
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

  void get dispose {
    count.close();
  }
}
