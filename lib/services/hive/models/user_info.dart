// import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @Default(null) String? refId,
    required String id,
    @Default(1) int slot,
    required String batch,
    required String stream,
    required int year,
    required DateTime date,
    required String userName,
    @Default('viewer') String role,
    @Default(null) int? semester,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

// class UserInfo {
//   final String? refId;
//   final String id;
//   final int slot;
//   final String batch;
//   final String stream;
//   final int year;
//   final DateTime date;
//   final String userName;
//   final String role;
//   const UserInfo(
//       {this.refId,
//       required this.id,
//       this.slot = 1,
//       required this.batch,
//       required this.stream,
//       required this.year,
//       required this.date,
//       required this.userName,
//       this.role = 'viewer'});

//   UserInfo copyWith(
//           {String? refId,
//           String? id,
//           int? slot,
//           String? batch,
//           String? stream,
//           int? year,
//           DateTime? date,
//           String? userName,
//           String? role}) =>
//       UserInfo(
//           refId: refId ?? this.refId,
//           id: id ?? this.id,
//           slot: slot ?? this.slot,
//           batch: batch ?? this.batch,
//           stream: stream ?? this.stream,
//           year: year ?? this.year,
//           date: date ?? this.date,
//           userName: userName ?? this.userName,
//           role: role ?? this.role);

//   Map<String, dynamic> get toMap => <String, dynamic>{
//         'refId': refId,
//         'id': id,
//         'slot': slot,
//         'batch': batch,
//         'stream': stream,
//         'year': year,
//         'date': date.millisecondsSinceEpoch,
//         'userName': userName,
//         'role': role
//       };

//   factory UserInfo.fromMap(Map<String, dynamic> map) => UserInfo(
//       refId: map['refId'] != null ? map['refId'] as String : null,
//       id: map['id'] as String,
//       slot: map['slot'] as int,
//       batch: map['batch'] as String,
//       stream: map['stream'] as String,
//       year: map['year'] as int,
//       date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
//       userName: map['userName'] as String,
//       role: map['role'] as String);

//   String toJson() => json.encode(toMap);

//   factory UserInfo.fromJson(String source) =>
//       UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);
// }
