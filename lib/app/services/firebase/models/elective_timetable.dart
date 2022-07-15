import 'dart:convert';

class ElectiveTimetable {
  final String day;
  final String? section;
  final String? room1;
  final String? time1;
  final String? room2;
  final String? time2;
  const ElectiveTimetable(
      {required this.day,
      this.section,
      this.room1,
      this.time1,
      this.room2,
      this.time2});

  Map<String, dynamic> toMap() => <String, dynamic>{
        'day': day,
        'section': section,
        'room1': room1,
        'time1': time1,
        'room2': room2,
        'time2': time2,
      };

  factory ElectiveTimetable.fromMap(Map<String, dynamic> map) =>
      ElectiveTimetable(
        day: map['day'] as String,
        section: map['section'] != null ? map['section'] as String : null,
        room1: map['room1'] != null ? map['room1'] as String : null,
        time1: map['time1'] != null ? map['time1'] as String : null,
        room2: map['room2'] != null ? map['room2'] as String : null,
        time2: map['time2'] != null ? map['time2'] as String : null,
      );

  String toJson() => json.encode(toMap());

  factory ElectiveTimetable.fromJson(String source) =>
      ElectiveTimetable.fromMap(json.decode(source) as Map<String, dynamic>);
}
