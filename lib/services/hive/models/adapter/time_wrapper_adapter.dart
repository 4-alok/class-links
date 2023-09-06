// import 'package:hive_flutter/adapters.dart';

// import '../time_wrapper.dart';
// import '../user_info.dart';

// class TimeWrapedAdapter extends TypeAdapter<TimeWraped<UserInfo>> {
//   @override
//   final int typeId = 11;

//   @override
//   TimeWraped<UserInfo> read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return TimeWraped(
//       data: fields[0] as UserInfo,
//       time: fields[1] as DateTime,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, TimeWraped<UserInfo> obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.data)
//       ..writeByte(1)
//       ..write(obj.time);
//   }
// }
