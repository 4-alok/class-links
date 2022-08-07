// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../global/models/time_table/time_table.dart';

class DayList {
  final List<Day> days;
  const DayList({required this.days});

  Map<String, dynamic> get toMap => <String, dynamic>{
        'days': days.map((x) => x.toJson()).toList(),
      };

  factory DayList.fromMap(Map<String, dynamic> map) => DayList(
          days: List<Day>.from(
        (map['days']).map<Day>(
          (x) => Day.fromJson(x as Map<String, dynamic>),
        ),
      ));

  String toJson() => json.encode(toMap);

  factory DayList.fromJson(String source) =>
      DayList.fromMap(json.decode(source) as Map<String, dynamic>);
}
