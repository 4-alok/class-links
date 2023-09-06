// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  String? get refId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get slot => throw _privateConstructorUsedError;
  String get batch => throw _privateConstructorUsedError;
  String get stream => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  int? get semester => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {String? refId,
      String id,
      int slot,
      String batch,
      String stream,
      int year,
      DateTime date,
      String userName,
      String role,
      int? semester});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refId = freezed,
    Object? id = null,
    Object? slot = null,
    Object? batch = null,
    Object? stream = null,
    Object? year = null,
    Object? date = null,
    Object? userName = null,
    Object? role = null,
    Object? semester = freezed,
  }) {
    return _then(_value.copyWith(
      refId: freezed == refId
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$$_UserInfoCopyWith(
          _$_UserInfo value, $Res Function(_$_UserInfo) then) =
      __$$_UserInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? refId,
      String id,
      int slot,
      String batch,
      String stream,
      int year,
      DateTime date,
      String userName,
      String role,
      int? semester});
}

/// @nodoc
class __$$_UserInfoCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$_UserInfo>
    implements _$$_UserInfoCopyWith<$Res> {
  __$$_UserInfoCopyWithImpl(
      _$_UserInfo _value, $Res Function(_$_UserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refId = freezed,
    Object? id = null,
    Object? slot = null,
    Object? batch = null,
    Object? stream = null,
    Object? year = null,
    Object? date = null,
    Object? userName = null,
    Object? role = null,
    Object? semester = freezed,
  }) {
    return _then(_$_UserInfo(
      refId: freezed == refId
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfo implements _UserInfo {
  const _$_UserInfo(
      {this.refId = null,
      required this.id,
      this.slot = 1,
      required this.batch,
      required this.stream,
      required this.year,
      required this.date,
      required this.userName,
      this.role = 'viewer',
      this.semester = null});

  factory _$_UserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoFromJson(json);

  @override
  @JsonKey()
  final String? refId;
  @override
  final String id;
  @override
  @JsonKey()
  final int slot;
  @override
  final String batch;
  @override
  final String stream;
  @override
  final int year;
  @override
  final DateTime date;
  @override
  final String userName;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final int? semester;

  @override
  String toString() {
    return 'UserInfo(refId: $refId, id: $id, slot: $slot, batch: $batch, stream: $stream, year: $year, date: $date, userName: $userName, role: $role, semester: $semester)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfo &&
            (identical(other.refId, refId) || other.refId == refId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, refId, id, slot, batch, stream,
      year, date, userName, role, semester);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      __$$_UserInfoCopyWithImpl<_$_UserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {final String? refId,
      required final String id,
      final int slot,
      required final String batch,
      required final String stream,
      required final int year,
      required final DateTime date,
      required final String userName,
      final String role,
      final int? semester}) = _$_UserInfo;

  factory _UserInfo.fromJson(Map<String, dynamic> json) = _$_UserInfo.fromJson;

  @override
  String? get refId;
  @override
  String get id;
  @override
  int get slot;
  @override
  String get batch;
  @override
  String get stream;
  @override
  int get year;
  @override
  DateTime get date;
  @override
  String get userName;
  @override
  String get role;
  @override
  int? get semester;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
