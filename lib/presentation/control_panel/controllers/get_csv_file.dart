import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../../global/utils/get_snackbar.dart';
import '../../../../services/firebase/models/elective_timetable.dart';
import '../../../../services/firebase/models/user_section.dart';
import '../../../global/models/time_table/time_table.dart';

mixin GetFile {
  List<Subject> _generateSubject(List row) {
    List<Subject> subjects = [];

    if (row[3] != 'x') {
      subjects.add(
        Subject(
          subjectName: row[3].toString(),
          startTime: DayTime(hour: 15, minute: 0),
          roomNo: row[2].toString(),
        ),
      );
    }

    if (row[5] != 'x') {
      subjects.add(
        Subject(
          subjectName: row[5].toString(),
          startTime: DayTime(hour: 16, minute: 0),
          roomNo: row[4].toString(),
        ),
      );
    }

    if (row[7] != 'x') {
      subjects.add(
        Subject(
          subjectName: row[7].toString(),
          startTime: DayTime(hour: 17, minute: 0),
          roomNo: row[6].toString(),
        ),
      );
    }
    return subjects;
  }

  List<UserSecetion> getUserSections(List<List<dynamic>> rawData) => rawData
      .map((e) => UserSecetion(
            rollNo: e[0],
            name: e[1],
            section: e[2],
            elective1Section: e[3],
            elective2Section: e[4],
          ))
      .toList();

  List<ElectiveTimetable> getElectiveTimetable(List<List<dynamic>> rawData) {
    rawData.removeAt(0);
    List<ElectiveTimetable> electiveTimetables = [];

    for (var row in rawData) {
      final subjects = _generateSubject(row);
      if (subjects.isNotEmpty) {
        electiveTimetables.add(
          ElectiveTimetable(
            day: row[0].toString(),
            section: row[1].toString(),
            subjects: subjects,
          ),
        );
      }
    }
    return electiveTimetables;
  }

  Future<List<List<dynamic>>> getDataFromAsset(String path) async {
    final byteData = await rootBundle.load(path);
    return await Stream.value(List<int>.from(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)))
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
  }

  Future<List<List<dynamic>>> get getFileData async {
    try {
      await FilePicker.platform.clearTemporaryFiles();
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["csv"],
      );

      return (result != null)
          ? await File(result.files.single.path!)
              .openRead()
              .transform(utf8.decoder)
              .transform(const CsvToListConverter())
              .toList()
          : [];
    } catch (e) {
      Message("Error while import", e.toString());
      return [];
    }
  }
}
