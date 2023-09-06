import 'package:hive_flutter/adapters.dart';

import 'time_table.dart';

class TimetableAdapter extends TypeAdapter<TimeTable> {
  @override
  final int typeId = 43;

  @override
  TimeTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeTable(
      week: (fields[0] as List).cast<Day>(),
      creatorId: fields[1] as String,
      batch: fields[2] as String,
      year: fields[3] as int,
      slot: fields[4] as int,
      date: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TimeTable obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.week)
      ..writeByte(1)
      ..write(obj.creatorId)
      ..writeByte(2)
      ..write(obj.batch)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.slot)
      ..writeByte(5)
      ..write(obj.date);
  }
}

class DayAdapter extends TypeAdapter<Day> {
  @override
  final int typeId = 42;

  @override
  Day read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Day(
      day: fields[0] as String,
      subjects: (fields[1] as List).cast<Subject>(),
    );
  }

  @override
  void write(BinaryWriter writer, Day obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.subjects);
  }
}

class SubjectAdapter extends TypeAdapter<Subject> {
  @override
  final int typeId = 41;

  @override
  Subject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subject(
      subjectName: fields[0] as String,
      roomNo: fields[1] as String?,
      isElective: fields[2] as bool,
      electiveSubjectCode: fields[3] as String?,
      teacherName: fields[4] as String?,
      startTime: fields[5] as DayTime,
    );
  }

  @override
  void write(BinaryWriter writer, Subject obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.subjectName)
      ..writeByte(1)
      ..write(obj.roomNo)
      ..writeByte(2)
      ..write(obj.isElective)
      ..writeByte(3)
      ..write(obj.electiveSubjectCode)
      ..writeByte(4)
      ..write(obj.teacherName)
      ..writeByte(5)
      ..write(obj.startTime);
  }
}

class DayTimeAdapter extends TypeAdapter<DayTime> {
  @override
  final int typeId = 40;

  @override
  DayTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayTime(
      hour: fields[0] as int,
      minute: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DayTime obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hour)
      ..writeByte(1)
      ..write(obj.minute);
  }
}