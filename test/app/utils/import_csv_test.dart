// ignore_for_file: avoid_print

import 'dart:io';

import 'package:class_link/app/utils/import_csv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test", () {
    final i = ImportCSV();
    test("Test", () {
      const row =
          "Monday,CLH100,CSE 1,AFL (CS1),COA (CS1),PDC (CS1),CWL200,CS1,OS (CS1),OS LAB (CS1),OS LAB (CS1),X,CLH300,CS1,X,BC (CS1),BC (CS1)";
      final rowValue = row.split(',');

      final res = i.subjects(rowValue);
      for (final e in res) {
        print("${e.roomNo} : ${e.startTime.hour} : ${e.subjectName}");
      }
      expect(1, 1);
    });
  });

  group("file Case", () {
    final i = ImportCSV();

    test("Test", () async {
      const path = "test/app/utils/t_1.csv";
      final file = File(path);

      final rowList = await file.readAsLines();
      final timetables = i.execute(rowList);

      for (final t in timetables) {
        print(t.batch);
        for (final w in t.week) {
          print(" ${w.day}");
          for (final s in w.subjects) {
            print("  ${s.startTime.hour} : ${s.roomNo} : ${s.subjectName}");
          }
        }
        print("");
      }
    });
  });

  group("Bracket remover", () {
    test("Case 1", () {
      String num = "Hello (85)";
      print(num.replaceAll(RegExp(r"\([^)]*\)"), "").trim());
    });
  });
}
