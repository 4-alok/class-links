import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateController {
  DateTime? _dateTime;

  final dateTimeTextController = TextEditingController();

  String get _getText =>
      _dateTime == null ? "" : DateFormat('yyyy-MM-dd').format(_dateTime!);

  DateTime? get getDateTime => _dateTime;

  set setDate(DateTime dateTime) {
    _dateTime = dateTime;
    dateTimeTextController.text = _getText;
  }

  void dispose() => dateTimeTextController.dispose();
}

class TimeController {
  DateTime? _dateTime;

  final dateTimeTextController = TextEditingController();

  String get _getText =>
      _dateTime == null ? "" : DateFormat('HH:mm a').format(_dateTime!);

  DateTime? get getDateTime => _dateTime;

  set setTime(DateTime time) {
    _dateTime = time;
    dateTimeTextController.text = _getText;
  }

  void dispose() => dateTimeTextController.dispose();
}
