// import 'dart:convert';

// import '../../../global/models/time_table/time_table.dart';

// class ElectiveTimetable {
//   final String day;
//   final String section;
//   final List<Subject> subjects;
//   ElectiveTimetable(
//       {required this.day, required this.section, required this.subjects});

//   Map<String, dynamic> toMap() => <String, dynamic>{
//         'day': day,
//         'section': section,
//         'subjects': subjects.map((x) => x.toJson).toList(),
//       };

//   factory ElectiveTimetable.fromMap(Map<String, dynamic> map) =>
//       ElectiveTimetable(
//         day: map['day'] as String,
//         section: map['section'] as String,
//         subjects: List<Subject>.from(
//           (map['subjects'] as List<dynamic>).map<Subject>(
//             (x) => Subject.fromJson(x as Map<String, dynamic>),
//           ),
//         ),
//       );

//   String toJson() => json.encode(toMap());

//   factory ElectiveTimetable.fromJson(String source) =>
//       ElectiveTimetable.fromMap(json.decode(source) as Map<String, dynamic>);
// }
