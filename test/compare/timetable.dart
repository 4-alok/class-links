import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

extension DayEquality on Day {
  bool equal(Day _day, [Day? _day2]) {
    if ((_day2?.day ?? day) == _day.day) {
      return const ListEquality().equals(_day2?.subjects ?? subjects, _day.subjects);
    } else {
      return false;
    }
  }
}
