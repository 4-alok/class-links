// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res>;
  $Res call(
      {String? refId,
      String id,
      int slot,
      String batch,
      String stream,
      int year,
      DateTime date,
      String userName,
      String role});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res> implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  final UserInfo _value;
  // ignore: unused_field
  final $Res Function(UserInfo) _then;

  @override
  $Res call({
    Object? refId = freezed,
    Object? id = freezed,
    Object? slot = freezed,
    Object? batch = freezed,
    Object? stream = freezed,
    Object? year = freezed,
    Object? date = freezed,
    Object? userName = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      refId: refId == freezed
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      slot: slot == freezed
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      stream: stream == freezed
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$$_UserInfoCopyWith(
          _$_UserInfo value, $Res Function(_$_UserInfo) then) =
      __$$_UserInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? refId,
      String id,
      int slot,
      String batch,
      String stream,
      int year,
      DateTime date,
      String userName,
      String role});
}

/// @nodoc
class __$$_UserInfoCopyWithImpl<$Res> extends _$UserInfoCopyWithImpl<$Res>
    implements _$$_UserInfoCopyWith<$Res> {
  __$$_UserInfoCopyWithImpl(
      _$_UserInfo _value, $Res Function(_$_UserInfo) _then)
      : super(_value, (v) => _then(v as _$_UserInfo));

  @override
  _$_UserInfo get _value => super._value as _$_UserInfo;

  @override
  $Res call({
    Object? refId = freezed,
    Object? id = freezed,
    Object? slot = freezed,
    Object? batch = freezed,
    Object? stream = freezed,
    Object? year = freezed,
    Object? date = freezed,
    Object? userName = freezed,
    Object? role = freezed,
  }) {
    return _then(_$_UserInfo(
      refId: refId == freezed
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      slot: slot == freezed
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      stream: stream == freezed
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.role = 'viewer'});

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
  String toString() {
    return 'UserInfo(refId: $refId, id: $id, slot: $slot, batch: $batch, stream: $stream, year: $year, date: $date, userName: $userName, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfo &&
            const DeepCollectionEquality().equals(other.refId, refId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.slot, slot) &&
            const DeepCollectionEquality().equals(other.batch, batch) &&
            const DeepCollectionEquality().equals(other.stream, stream) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.role, role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(refId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(slot),
      const DeepCollectionEquality().hash(batch),
      const DeepCollectionEquality().hash(stream),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(role));

  @JsonKey(ignore: true)
  @override
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
      final String role}) = _$_UserInfo;

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
  @JsonKey(ignore: true)
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
