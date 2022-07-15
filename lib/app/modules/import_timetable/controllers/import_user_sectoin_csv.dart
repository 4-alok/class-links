import 'dart:convert';
import 'dart:io';

import 'package:class_link/app/utils/get_snackbar.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../../services/firebase/models/user_section.dart';
import '../../../services/firebase/repository/firestore_service.dart';

class ImportUserSectionSection {
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

  Future<List<List<dynamic>>> get getFileData async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ["csv"]);

      if (result != null) {
        final path = result.files.single.path!;
        final input = File(path).openRead();
        return await input
            .transform(utf8.decoder)
            .transform(const CsvToListConverter())
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      Message("Error while import", e.toString());
      return [];
    }
  }

  void get dispose {
    uploading.close();
  }
}
