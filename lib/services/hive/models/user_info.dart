import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_info.freezed.dart';
// part 'user_info.g.dart';

// @freezed
// class UserInfo with _$UserInfo {
//   const factory UserInfo({
//     @Default(null) String? refId,
//     required String id,
//     @Default(1) int slot,
//     required String batch,
//     required String stream,
//     required int year,
//     required DateTime date,
//     required String userName,
//     @Default('viewer') String role,
//     @Default(null) int? semester,
//   }) = _UserInfo;

//   factory UserInfo.fromJson(Map<String, dynamic> json) =>
//       _$UserInfoFromJson(json);
// }

class UserInfo {
  final String? refId;
  final String id;
  final String userName;
  final int semester;
  final String stream;
  final String batch;
  final List<String> electiveSections;
  final String role;
  final DateTime joiningDate;
  final DateTime? lastUpdated;
  const UserInfo({
    this.refId,
    required this.id,
    required this.userName,
    required this.semester,
    required this.stream,
    required this.batch,
    required this.role,
    required this.joiningDate,
    this.lastUpdated,
    this.electiveSections = const [],
  });


  UserInfo copyWith({
    String? refId,
    String? id,
    String? userName,
    int? semester,
    String? stream,
    String? batch,
    String? role,
    DateTime? joiningDate,
    DateTime? lastUpdated,
    List<String>? electiveSections,
  }) {
    return UserInfo(
      refId: refId ?? this.refId,
      id: id ?? this.id,
      userName: userName ?? this.userName,
      semester: semester ?? this.semester,
      stream: stream ?? this.stream,
      batch: batch ?? this.batch,
      electiveSections: electiveSections ?? this.electiveSections,
      role: role ?? this.role,
      joiningDate: joiningDate ?? this.joiningDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'refId': refId,
      'id': id,
      'userName': userName,
      'semester': semester,
      'stream': stream,
      'batch': batch,
      'electiveSections': electiveSections,
      'role': role,
      'joiningDate': joiningDate.millisecondsSinceEpoch,
      'lastUpdated': lastUpdated?.millisecondsSinceEpoch,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      refId: map['refId'] != null ? map['refId'] as String : null,
      id: map['id'] as String,
      userName: map['userName'] as String,
      semester: map['semester'] as int,
      stream: map['stream'] as String,
      batch: map['batch'] as String,
      electiveSections: List<String>.from((map['electiveSections'] as List<String>)),
      role: map['role'] as String,
      joiningDate: DateTime.fromMillisecondsSinceEpoch(map['joiningDate'] as int),
      lastUpdated: map['lastUpdated'] != null ? DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) => UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfo(refId: $refId, id: $id, userName: $userName, semester: $semester, stream: $stream, batch: $batch, electiveSections: $electiveSections, role: $role, joiningDate: $joiningDate, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(covariant UserInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.refId == refId &&
      other.id == id &&
      other.userName == userName &&
      other.semester == semester &&
      other.stream == stream &&
      other.batch == batch &&
      listEquals(other.electiveSections, electiveSections) &&
      other.role == role &&
      other.joiningDate == joiningDate &&
      other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode {
    return refId.hashCode ^
      id.hashCode ^
      userName.hashCode ^
      semester.hashCode ^
      stream.hashCode ^
      batch.hashCode ^
      electiveSections.hashCode ^
      role.hashCode ^
      joiningDate.hashCode ^
      lastUpdated.hashCode;
  }
}

class UserInfoList {
  final List<UserInfo> list;
  const UserInfoList({required this.list});
}
