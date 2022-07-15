// // ignore_for_file: avoid_print

// import 'dart:io';

// import 'package:class_link/app/models/time_table/time_table.dart';
// import 'package:class_link/app/utils/import/first_year/first_year_import_utils.dart';
// import 'package:class_link/app/utils/import/first_year/first_year_import_utils_2.dart';
// import 'package:class_link/app/utils/import/second_year/second_year_import_utils.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group("2nd year rows test", () {
//     test("Test", () {
//       const row =
//           "Monday,CLH100,CSE 1,AFL (CS1),COA (CS1),PDC (CS1),CWL200,CS1,OS (CS1),OS LAB (CS1),OS LAB (CS1),X,CLH300,CS1,X,BC (CS1),BC (CS1)";

//       final rowValue = row.split(',');

//       final res = SecondYear().subjects(rowValue);
//       for (final e in res) {
//         print("${e.roomNo} : ${e.startTime.hour} : ${e.subjectName}");
//       }
//       expect(1, 1);
//     });
//   });

//   group("2nd year timetable test", () {
//     test("Test", () async {
//       const path = "test/app/utils/t_1.csv";
//       final file = File(path);

//       final rowList = await file.readAsLines();
//       final timetables = SecondYear().execute2ndYear(rowList);
//       tPrint(timetables);
//     });
//   });

//   group("Bracket remover", () {
//     test("Case 1", () {
//       String num = "Hello (85)";
//       print(num.replaceAll(RegExp(r"\([^)]*\)"), "").trim());
//     });
//   });

//   group("1st year s1 rows test", () {
//     test("Test", () {
//       const row2 =
//           "Monday,OA2,AAA,C,C,C,BBB,Bio.,Chem.,M–II,CCC,Comp. Prog. Lab.,Comp. Prog. Lab.,Comp. Prog. Lab.";

//       final rowValue = row2.split(',');

//       final res = FirstYearS1().subjects(rowValue);
//       for (final e in res) {
//         print("${e.roomNo} : ${e.startTime.hour} : ${e.subjectName}");
//       }
//       expect(1, 1);
//     });
//   });

//   group("1st year s1 timetable test", () {
//     test("Test", () async {
//       const path = "test/app/utils/first_year_1.csv";
//       final file = File(path);

//       final rowList = await file.readAsLines();
//       final timetables = FirstYearS1().execute1stYears1(rowList);
//       tPrint(timetables);
//     });
//   });

//   group("1st year s2 rows test", () {
//     test("Test", () {

//       const row =
//           "Monday,OB1,AAA,Y,BMS Pr.,BMS Pr.,BMS Pr.,BBB,Phy.,BEE,M–II,CCC,L,L,L";
//       final rowValue = row.split(',');

//       final res = FirstYearS2().subjects(rowValue);
//       for (final e in res) {
//         print("${e.roomNo} : ${e.startTime.hour} : ${e.subjectName}");
//       }
//       expect(1, 1);
//     });
//   });

//   group("1st year s2 timetable test", () {
//     test("Test", () async {
//       const path = "test/app/utils/first_year_2.csv";
//       final file = File(path);

//       final rowList = await file.readAsLines();
//       final timetables = FirstYearS2().execute1stYears2(rowList);
//       tPrint(timetables);
//       print(timetables.length);
//     });
//   });
// }

// tPrint(List<TimeTable> timetables) {
//   for (final t in timetables) {
//     print(t.batch);
//     for (final w in t.week) {
//       print(" ${w.day}");
//       for (final s in w.subjects) {
//         print("  ${s.startTime.hour} : ${s.roomNo} : ${s.subjectName}");
//       }
//     }
//     print("");
//   }
// }
