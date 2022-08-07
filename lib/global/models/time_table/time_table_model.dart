// import 'dart:convert';

// class TimeTable {
//   final List<Day> week;
//   final String creatorId;
//   final String batch;
//   final int year;
//   final int slot;
//   final DateTime date;
//   const TimeTable(
//       {required this.week,
//       required this.creatorId,
//       required this.batch,
//       required this.year,
//       required this.slot,
//       required this.date});

//   TimeTable copyWith(
//           {List<Day>? week,
//           String? creatorId,
//           String? batch,
//           int? year,
//           int? slot,
//           DateTime? date}) =>
//       TimeTable(
//           week: week ?? this.week,
//           creatorId: creatorId ?? this.creatorId,
//           batch: batch ?? this.batch,
//           year: year ?? this.year,
//           slot: slot ?? this.slot,
//           date: date ?? this.date);

//   Map<String, dynamic> get toMap => <String, dynamic>{
//         'week': week.map((x) => x.toMap).toList(),
//         'creatorId': creatorId,
//         'batch': batch,
//         'year': year,
//         'slot': slot,
//         'date': date.millisecondsSinceEpoch
//       };

//   factory TimeTable.fromMap(Map<String, dynamic> map) => TimeTable(
//       week: List<Day>.from(
//         (map['week'] as List<int>).map<Day>(
//           (x) => Day.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//       creatorId: map['creatorId'] as String,
//       batch: map['batch'] as String,
//       year: map['year'] as int,
//       slot: map['slot'] as int,
//       date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int));

//   String get toJson => json.encode(toMap);

//   factory TimeTable.fromJson(String source) =>
//       TimeTable.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// class Day {
//   final String day;
//   final List<Subject> subjects;
//   const Day({required this.day, required this.subjects});

//   Day copyWith({String? day, List<Subject>? subjects}) =>
//       Day(day: day ?? this.day, subjects: subjects ?? this.subjects);

//   Map<String, dynamic> get toMap => <String, dynamic>{
//         'day': day,
//         'subjects': subjects.map((x) => x.toMap).toList(),
//       };

//   factory Day.fromMap(Map<String, dynamic> map) => Day(
//         day: map['day'] as String,
//         subjects: List<Subject>.from(
//           (map['subjects'] as List<int>).map<Subject>(
//             (x) => Subject.fromMap(x as Map<String, dynamic>),
//           ),
//         ),
//       );

//   String get toJson => json.encode(toMap);

//   factory Day.fromJson(String source) =>
//       Day.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// class Subject {
//   final String subjectName;
//   final String subjectAddBy;
//   final String remark;
//   final String remarkAddBy;
//   final String googleClassRoomLink;
//   final String gLinkAddBy;
//   final String? roomNo;
//   final String roomNoAddBy;
//   final String zoomLink;
//   final String zLinkAddBy;
//   final DayTime startTime;
//   const Subject(
//       {required this.subjectName,
//       this.subjectAddBy = '',
//       this.remark = '',
//       this.remarkAddBy = '',
//       this.googleClassRoomLink = '',
//       this.gLinkAddBy = '',
//       this.roomNo,
//       this.roomNoAddBy = '',
//       this.zoomLink = '',
//       this.zLinkAddBy = '',
//       required this.startTime});

//   Subject copyWith(
//           {String? subjectName,
//           String? subjectAddBy,
//           String? remark,
//           String? remarkAddBy,
//           String? googleClassRoomLink,
//           String? gLinkAddBy,
//           String? roomNo,
//           String? roomNoAddBy,
//           String? zoomLink,
//           String? zLinkAddBy,
//           DayTime? startTime}) =>
//       Subject(
//           subjectName: subjectName ?? this.subjectName,
//           subjectAddBy: subjectAddBy ?? this.subjectAddBy,
//           remark: remark ?? this.remark,
//           remarkAddBy: remarkAddBy ?? this.remarkAddBy,
//           googleClassRoomLink: googleClassRoomLink ?? this.googleClassRoomLink,
//           gLinkAddBy: gLinkAddBy ?? this.gLinkAddBy,
//           roomNo: roomNo ?? this.roomNo,
//           roomNoAddBy: roomNoAddBy ?? this.roomNoAddBy,
//           zoomLink: zoomLink ?? this.zoomLink,
//           zLinkAddBy: zLinkAddBy ?? this.zLinkAddBy,
//           startTime: startTime ?? this.startTime);

//   Map<String, dynamic> get toMap => <String, dynamic>{
//         'subjectName': subjectName,
//         'subjectAddBy': subjectAddBy,
//         'remark': remark,
//         'remarkAddBy': remarkAddBy,
//         'googleClassRoomLink': googleClassRoomLink,
//         'gLinkAddBy': gLinkAddBy,
//         'roomNo': roomNo,
//         'roomNoAddBy': roomNoAddBy,
//         'zoomLink': zoomLink,
//         'zLinkAddBy': zLinkAddBy,
//         'startTime': startTime.toMap
//       };

//   factory Subject.fromMap(Map<String, dynamic> map) => Subject(
//       subjectName: map['subjectName'] as String,
//       subjectAddBy: map['subjectAddBy'] as String,
//       remark: map['remark'] as String,
//       remarkAddBy: map['remarkAddBy'] as String,
//       googleClassRoomLink: map['googleClassRoomLink'] as String,
//       gLinkAddBy: map['gLinkAddBy'] as String,
//       roomNo: map['roomNo'] != null ? map['roomNo'] as String : null,
//       roomNoAddBy: map['roomNoAddBy'] as String,
//       zoomLink: map['zoomLink'] as String,
//       zLinkAddBy: map['zLinkAddBy'] as String,
//       startTime: DayTime.fromMap(map['startTime'] as Map<String, dynamic>));

//   String get toJson => json.encode(toMap);

//   factory Subject.fromJson(String source) =>
//       Subject.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// class DayTime {
//   final int hour;
//   final int minute;
//   DayTime({
//     required this.hour,
//     required this.minute,
//   });

//   DayTime copyWith({
//     int? hour,
//     int? minute,
//   }) {
//     return DayTime(
//       hour: hour ?? this.hour,
//       minute: minute ?? this.minute,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'hour': hour,
//       'minute': minute,
//     };
//   }

//   factory DayTime.fromMap(Map<String, dynamic> map) {
//     return DayTime(
//       hour: map['hour'] as int,
//       minute: map['minute'] as int,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory DayTime.fromJson(String source) =>
//       DayTime.fromMap(json.decode(source) as Map<String, dynamic>);
// }
