import 'package:hive_flutter/adapters.dart';

import '../user_info.dart';

class UserInfoListAdapter extends TypeAdapter<UserInfoList> {
  @override
  final int typeId = 14;

  @override
  UserInfoList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoList(
      list: (fields[0] as List).cast<UserInfo>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserInfoList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.list);
  }
}

class UserInfoAdapter extends TypeAdapter<UserInfo> {
  @override
  final int typeId = 10;

  @override
  UserInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfo(
      refId: fields[0] as String?,
      id: fields[1] as String,
      slot: fields[2] as int,
      batch: fields[3] as String,
      stream: fields[4] as String,
      year: fields[5] as int,
      date: fields[6] as DateTime,
      userName: fields[7] as String,
      role: fields[8] as String,
      semester: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfo obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.refId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.slot)
      ..writeByte(3)
      ..write(obj.batch)
      ..writeByte(4)
      ..write(obj.stream)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.userName)
      ..writeByte(8)
      ..write(obj.role)
      ..writeByte(9)
      ..write(obj.semester);
  }
}
