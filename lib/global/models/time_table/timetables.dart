// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';

import 'time_table.dart';

class TimeTables {
  final List<TimeTable> timeTables;
  const TimeTables(this.timeTables);
}

class TimetablesAdapter extends TypeAdapter<TimeTables> {
  @override
  TimeTables read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeTables(
      (fields[0] as List).cast<TimeTable>(),
    );
  }

  @override
  int get typeId => 44;

  @override
  void write(BinaryWriter writer, TimeTables obj) => writer
    ..writeByte(1)
    ..writeByte(0)
    ..write(obj.timeTables);
}
