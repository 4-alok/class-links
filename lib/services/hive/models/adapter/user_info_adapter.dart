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
      userName: fields[2] as String,
      semester: fields[3] as int,
      stream: fields[4] as String,
      batch: fields[5] as String,
      electiveSections: (fields[6] as List).cast<String>(),
      role: fields[7] as String,
      joiningDate: fields[8] as DateTime,
      lastUpdated: fields[9] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfo obj) => writer
    ..writeByte(10)
    ..writeByte(0)
    ..write(obj.refId)
    ..writeByte(1)
    ..write(obj.id)
    ..writeByte(2)
    ..write(obj.userName)
    ..writeByte(3)
    ..write(obj.semester)
    ..writeByte(4)
    ..write(obj.stream)
    ..writeByte(5)
    ..write(obj.batch)
    ..writeByte(6)
    ..write(obj.electiveSections)
    ..writeByte(7)
    ..write(obj.role)
    ..writeByte(8)
    ..write(obj.joiningDate)
    ..writeByte(9)
    ..write(obj.lastUpdated);
}
