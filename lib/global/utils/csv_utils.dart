import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

abstract class CsvUtils {
  static Future<List<List<dynamic>>> readCSVFile(String path) async {
    final byteData = await rootBundle.load(path);
    return await Stream.value(List<int>.from(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)))
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
  }
}
