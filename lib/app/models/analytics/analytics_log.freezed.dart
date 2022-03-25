// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'analytics_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnalyticsLog _$AnalyticsLogFromJson(Map<String, dynamic> json) {
  return _AnalyticsLog.fromJson(json);
}

/// @nodoc
class _$AnalyticsLogTearOff {
  const _$AnalyticsLogTearOff();

  _AnalyticsLog call(
      {String? refId = null,
      required String id,
      int slot = 1,
      required String batch,
      required String stream,
      required int year,
      required DateTime date}) {
    return _AnalyticsLog(
      refId: refId,
      id: id,
      slot: slot,
      batch: batch,
      stream: stream,
      year: year,
      date: date,
    );
  }

  AnalyticsLog fromJson(Map<String, Object?> json) {
    return AnalyticsLog.fromJson(json);
  }
}

/// @nodoc
const $AnalyticsLog = _$AnalyticsLogTearOff();

/// @nodoc
mixin _$AnalyticsLog {
  String? get refId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get slot => throw _privateConstructorUsedError;
  String get batch => throw _privateConstructorUsedError;
  String get stream => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsLogCopyWith<AnalyticsLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsLogCopyWith<$Res> {
  factory $AnalyticsLogCopyWith(
          AnalyticsLog value, $Res Function(AnalyticsLog) then) =
      _$AnalyticsLogCopyWithImpl<$Res>;
  $Res call(
      {String? refId,
      String id,
      int slot,
      String batch,
      String stream,
      int year,
      DateTime date});
}

/// @nodoc
class _$AnalyticsLogCopyWithImpl<$Res> implements $AnalyticsLogCopyWith<$Res> {
  _$AnalyticsLogCopyWithImpl(this._value, this._then);

  final AnalyticsLog _value;
  // ignore: unused_field
  final $Res Function(AnalyticsLog) _then;

  @override
  $Res call({
    Object? refId = freezed,
    Object? id = freezed,
    Object? slot = freezed,
    Object? batch = freezed,
    Object? stream = freezed,
    Object? year = freezed,
    Object? date = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$AnalyticsLogCopyWith<$Res>
    implements $AnalyticsLogCopyWith<$Res> {
  factory _$AnalyticsLogCopyWith(
          _AnalyticsLog value, $Res Function(_AnalyticsLog) then) =
      __$AnalyticsLogCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? refId,
      String id,
      int slot,
      String batch,
      String stream,
      int year,
      DateTime date});
}

/// @nodoc
class __$AnalyticsLogCopyWithImpl<$Res> extends _$AnalyticsLogCopyWithImpl<$Res>
    implements _$AnalyticsLogCopyWith<$Res> {
  __$AnalyticsLogCopyWithImpl(
      _AnalyticsLog _value, $Res Function(_AnalyticsLog) _then)
      : super(_value, (v) => _then(v as _AnalyticsLog));

  @override
  _AnalyticsLog get _value => super._value as _AnalyticsLog;

  @override
  $Res call({
    Object? refId = freezed,
    Object? id = freezed,
    Object? slot = freezed,
    Object? batch = freezed,
    Object? stream = freezed,
    Object? year = freezed,
    Object? date = freezed,
  }) {
    return _then(_AnalyticsLog(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnalyticsLog implements _AnalyticsLog {
  const _$_AnalyticsLog(
      {this.refId = null,
      required this.id,
      this.slot = 1,
      required this.batch,
      required this.stream,
      required this.year,
      required this.date});

  factory _$_AnalyticsLog.fromJson(Map<String, dynamic> json) =>
      _$$_AnalyticsLogFromJson(json);

  @JsonKey()
  @override
  final String? refId;
  @override
  final String id;
  @JsonKey()
  @override
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
  String toString() {
    return 'AnalyticsLog(refId: $refId, id: $id, slot: $slot, batch: $batch, stream: $stream, year: $year, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyticsLog &&
            const DeepCollectionEquality().equals(other.refId, refId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.slot, slot) &&
            const DeepCollectionEquality().equals(other.batch, batch) &&
            const DeepCollectionEquality().equals(other.stream, stream) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(refId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(slot),
      const DeepCollectionEquality().hash(batch),
      const DeepCollectionEquality().hash(stream),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$AnalyticsLogCopyWith<_AnalyticsLog> get copyWith =>
      __$AnalyticsLogCopyWithImpl<_AnalyticsLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalyticsLogToJson(this);
  }
}

abstract class _AnalyticsLog implements AnalyticsLog {
  const factory _AnalyticsLog(
      {String? refId,
      required String id,
      int slot,
      required String batch,
      required String stream,
      required int year,
      required DateTime date}) = _$_AnalyticsLog;

  factory _AnalyticsLog.fromJson(Map<String, dynamic> json) =
      _$_AnalyticsLog.fromJson;

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
  @JsonKey(ignore: true)
  _$AnalyticsLogCopyWith<_AnalyticsLog> get copyWith =>
      throw _privateConstructorUsedError;
}

ThemeUsageLog _$ThemeUsageLogFromJson(Map<String, dynamic> json) {
  return _ThemeUsageLog.fromJson(json);
}

/// @nodoc
class _$ThemeUsageLogTearOff {
  const _$ThemeUsageLogTearOff();

  _ThemeUsageLog call(
      {bool? isBlack = null,
      bool? themeModeLight = null,
      required String themeName}) {
    return _ThemeUsageLog(
      isBlack: isBlack,
      themeModeLight: themeModeLight,
      themeName: themeName,
    );
  }

  ThemeUsageLog fromJson(Map<String, Object?> json) {
    return ThemeUsageLog.fromJson(json);
  }
}

/// @nodoc
const $ThemeUsageLog = _$ThemeUsageLogTearOff();

/// @nodoc
mixin _$ThemeUsageLog {
  bool? get isBlack => throw _privateConstructorUsedError;
  bool? get themeModeLight => throw _privateConstructorUsedError;
  String get themeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemeUsageLogCopyWith<ThemeUsageLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeUsageLogCopyWith<$Res> {
  factory $ThemeUsageLogCopyWith(
          ThemeUsageLog value, $Res Function(ThemeUsageLog) then) =
      _$ThemeUsageLogCopyWithImpl<$Res>;
  $Res call({bool? isBlack, bool? themeModeLight, String themeName});
}

/// @nodoc
class _$ThemeUsageLogCopyWithImpl<$Res>
    implements $ThemeUsageLogCopyWith<$Res> {
  _$ThemeUsageLogCopyWithImpl(this._value, this._then);

  final ThemeUsageLog _value;
  // ignore: unused_field
  final $Res Function(ThemeUsageLog) _then;

  @override
  $Res call({
    Object? isBlack = freezed,
    Object? themeModeLight = freezed,
    Object? themeName = freezed,
  }) {
    return _then(_value.copyWith(
      isBlack: isBlack == freezed
          ? _value.isBlack
          : isBlack // ignore: cast_nullable_to_non_nullable
              as bool?,
      themeModeLight: themeModeLight == freezed
          ? _value.themeModeLight
          : themeModeLight // ignore: cast_nullable_to_non_nullable
              as bool?,
      themeName: themeName == freezed
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ThemeUsageLogCopyWith<$Res>
    implements $ThemeUsageLogCopyWith<$Res> {
  factory _$ThemeUsageLogCopyWith(
          _ThemeUsageLog value, $Res Function(_ThemeUsageLog) then) =
      __$ThemeUsageLogCopyWithImpl<$Res>;
  @override
  $Res call({bool? isBlack, bool? themeModeLight, String themeName});
}

/// @nodoc
class __$ThemeUsageLogCopyWithImpl<$Res>
    extends _$ThemeUsageLogCopyWithImpl<$Res>
    implements _$ThemeUsageLogCopyWith<$Res> {
  __$ThemeUsageLogCopyWithImpl(
      _ThemeUsageLog _value, $Res Function(_ThemeUsageLog) _then)
      : super(_value, (v) => _then(v as _ThemeUsageLog));

  @override
  _ThemeUsageLog get _value => super._value as _ThemeUsageLog;

  @override
  $Res call({
    Object? isBlack = freezed,
    Object? themeModeLight = freezed,
    Object? themeName = freezed,
  }) {
    return _then(_ThemeUsageLog(
      isBlack: isBlack == freezed
          ? _value.isBlack
          : isBlack // ignore: cast_nullable_to_non_nullable
              as bool?,
      themeModeLight: themeModeLight == freezed
          ? _value.themeModeLight
          : themeModeLight // ignore: cast_nullable_to_non_nullable
              as bool?,
      themeName: themeName == freezed
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ThemeUsageLog implements _ThemeUsageLog {
  const _$_ThemeUsageLog(
      {this.isBlack = null,
      this.themeModeLight = null,
      required this.themeName});

  factory _$_ThemeUsageLog.fromJson(Map<String, dynamic> json) =>
      _$$_ThemeUsageLogFromJson(json);

  @JsonKey()
  @override
  final bool? isBlack;
  @JsonKey()
  @override
  final bool? themeModeLight;
  @override
  final String themeName;

  @override
  String toString() {
    return 'ThemeUsageLog(isBlack: $isBlack, themeModeLight: $themeModeLight, themeName: $themeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeUsageLog &&
            const DeepCollectionEquality().equals(other.isBlack, isBlack) &&
            const DeepCollectionEquality()
                .equals(other.themeModeLight, themeModeLight) &&
            const DeepCollectionEquality().equals(other.themeName, themeName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isBlack),
      const DeepCollectionEquality().hash(themeModeLight),
      const DeepCollectionEquality().hash(themeName));

  @JsonKey(ignore: true)
  @override
  _$ThemeUsageLogCopyWith<_ThemeUsageLog> get copyWith =>
      __$ThemeUsageLogCopyWithImpl<_ThemeUsageLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThemeUsageLogToJson(this);
  }
}

abstract class _ThemeUsageLog implements ThemeUsageLog {
  const factory _ThemeUsageLog(
      {bool? isBlack,
      bool? themeModeLight,
      required String themeName}) = _$_ThemeUsageLog;

  factory _ThemeUsageLog.fromJson(Map<String, dynamic> json) =
      _$_ThemeUsageLog.fromJson;

  @override
  bool? get isBlack;
  @override
  bool? get themeModeLight;
  @override
  String get themeName;
  @override
  @JsonKey(ignore: true)
  _$ThemeUsageLogCopyWith<_ThemeUsageLog> get copyWith =>
      throw _privateConstructorUsedError;
}
