import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

import '../../../utils/get_snackbar.dart';

mixin GetFile {
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
}
