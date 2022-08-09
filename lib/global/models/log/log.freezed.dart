// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogData {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get log => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogDataCopyWith<LogData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogDataCopyWith<$Res> {
  factory $LogDataCopyWith(LogData value, $Res Function(LogData) then) =
      _$LogDataCopyWithImpl<$Res>;
  $Res call({String name, String email, String log, DateTime date});
}

/// @nodoc
class _$LogDataCopyWithImpl<$Res> implements $LogDataCopyWith<$Res> {
  _$LogDataCopyWithImpl(this._value, this._then);

  final LogData _value;
  // ignore: unused_field
  final $Res Function(LogData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? log = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      log: log == freezed
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_LogDataCopyWith<$Res> implements $LogDataCopyWith<$Res> {
  factory _$$_LogDataCopyWith(
          _$_LogData value, $Res Function(_$_LogData) then) =
      __$$_LogDataCopyWithImpl<$Res>;
  @override
  $Res call({String name, String email, String log, DateTime date});
}

/// @nodoc
class __$$_LogDataCopyWithImpl<$Res> extends _$LogDataCopyWithImpl<$Res>
    implements _$$_LogDataCopyWith<$Res> {
  __$$_LogDataCopyWithImpl(_$_LogData _value, $Res Function(_$_LogData) _then)
      : super(_value, (v) => _then(v as _$_LogData));

  @override
  _$_LogData get _value => super._value as _$_LogData;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? log = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_LogData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      log: log == freezed
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_LogData implements _LogData {
  const _$_LogData(
      {required this.name,
      required this.email,
      required this.log,
      required this.date});

  @override
  final String name;
  @override
  final String email;
  @override
  final String log;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'LogData(name: $name, email: $email, log: $log, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogData &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.log, log) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(log),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_LogDataCopyWith<_$_LogData> get copyWith =>
      __$$_LogDataCopyWithImpl<_$_LogData>(this, _$identity);
}

abstract class _LogData implements LogData {
  const factory _LogData(
      {required final String name,
      required final String email,
      required final String log,
      required final DateTime date}) = _$_LogData;

  @override
  String get name;
  @override
  String get email;
  @override
  String get log;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_LogDataCopyWith<_$_LogData> get copyWith =>
      throw _privateConstructorUsedError;
}
