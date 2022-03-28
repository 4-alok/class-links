import 'dart:io';
import '../../models/time_table/time_table.dart';
import 'first_year/first_year_import_utils_2.dart';

class ImportCSV {
  Future<List<TimeTable>> import(File file) async {
    try {
      final rowList = await file.readAsLines();
      var k = FirstYearS2().execute1stYears2(rowList);
      for (var element in k) {
        element.week.add(const Day(day: "Saturday", subjects: []));
        element.week.add(const Day(day: "Sunday", subjects: []));
      }
      return k;
    } catch (e) {
      rethrow;
    }
  }
}

class FileUtils {
  static void pickFileTask() async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ["csv"],
    // );

    // if (result != null) {
    //   final file = File(result.files.single.path!);
    //   final res = await ImportCSV().import(file);
    //   await Get.find<FirestoreService>().addTimeTables(res);
    // } else {}
    // await FilePicker.platform.clearTemporaryFiles();
  }
}
