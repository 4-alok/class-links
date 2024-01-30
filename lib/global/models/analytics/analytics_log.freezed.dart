// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnalyticsLog _$AnalyticsLogFromJson(Map<String, dynamic> json) {
  return _AnalyticsLog.fromJson(json);
}

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
      _$AnalyticsLogCopyWithImpl<$Res, AnalyticsLog>;
  @useResult
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
class _$AnalyticsLogCopyWithImpl<$Res, $Val extends AnalyticsLog>
    implements $AnalyticsLogCopyWith<$Res> {
  _$AnalyticsLogCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsLogImplCopyWith<$Res>
    implements $AnalyticsLogCopyWith<$Res> {
  factory _$$AnalyticsLogImplCopyWith(
          _$AnalyticsLogImpl value, $Res Function(_$AnalyticsLogImpl) then) =
      __$$AnalyticsLogImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$AnalyticsLogImplCopyWithImpl<$Res>
    extends _$AnalyticsLogCopyWithImpl<$Res, _$AnalyticsLogImpl>
    implements _$$AnalyticsLogImplCopyWith<$Res> {
  __$$AnalyticsLogImplCopyWithImpl(
      _$AnalyticsLogImpl _value, $Res Function(_$AnalyticsLogImpl) _then)
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
  }) {
    return _then(_$AnalyticsLogImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsLogImpl implements _AnalyticsLog {
  const _$AnalyticsLogImpl(
      {this.refId = null,
      required this.id,
      this.slot = 1,
      required this.batch,
      required this.stream,
      required this.year,
      required this.date});

  factory _$AnalyticsLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsLogImplFromJson(json);

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
  String toString() {
    return 'AnalyticsLog(refId: $refId, id: $id, slot: $slot, batch: $batch, stream: $stream, year: $year, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsLogImpl &&
            (identical(other.refId, refId) || other.refId == refId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, refId, id, slot, batch, stream, year, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsLogImplCopyWith<_$AnalyticsLogImpl> get copyWith =>
      __$$AnalyticsLogImplCopyWithImpl<_$AnalyticsLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsLogImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsLog implements AnalyticsLog {
  const factory _AnalyticsLog(
      {final String? refId,
      required final String id,
      final int slot,
      required final String batch,
      required final String stream,
      required final int year,
      required final DateTime date}) = _$AnalyticsLogImpl;

  factory _AnalyticsLog.fromJson(Map<String, dynamic> json) =
      _$AnalyticsLogImpl.fromJson;

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
  _$$AnalyticsLogImplCopyWith<_$AnalyticsLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThemeUsageLog _$ThemeUsageLogFromJson(Map<String, dynamic> json) {
  return _ThemeUsageLog.fromJson(json);
}

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
      _$ThemeUsageLogCopyWithImpl<$Res, ThemeUsageLog>;
  @useResult
  $Res call({bool? isBlack, bool? themeModeLight, String themeName});
}

/// @nodoc
class _$ThemeUsageLogCopyWithImpl<$Res, $Val extends ThemeUsageLog>
    implements $ThemeUsageLogCopyWith<$Res> {
  _$ThemeUsageLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBlack = freezed,
    Object? themeModeLight = freezed,
    Object? themeName = null,
  }) {
    return _then(_value.copyWith(
      isBlack: freezed == isBlack
          ? _value.isBlack
          : isBlack // ignore: cast_nullable_to_non_nullable
              as bool?,
      themeModeLight: freezed == themeModeLight
          ? _value.themeModeLight
          : themeModeLight // ignore: cast_nullable_to_non_nullable
              as bool?,
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeUsageLogImplCopyWith<$Res>
    implements $ThemeUsageLogCopyWith<$Res> {
  factory _$$ThemeUsageLogImplCopyWith(
          _$ThemeUsageLogImpl value, $Res Function(_$ThemeUsageLogImpl) then) =
      __$$ThemeUsageLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isBlack, bool? themeModeLight, String themeName});
}

/// @nodoc
class __$$ThemeUsageLogImplCopyWithImpl<$Res>
    extends _$ThemeUsageLogCopyWithImpl<$Res, _$ThemeUsageLogImpl>
    implements _$$ThemeUsageLogImplCopyWith<$Res> {
  __$$ThemeUsageLogImplCopyWithImpl(
      _$ThemeUsageLogImpl _value, $Res Function(_$ThemeUsageLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBlack = freezed,
    Object? themeModeLight = freezed,
    Object? themeName = null,
  }) {
    return _then(_$ThemeUsageLogImpl(
      isBlack: freezed == isBlack
          ? _value.isBlack
          : isBlack // ignore: cast_nullable_to_non_nullable
              as bool?,
      themeModeLight: freezed == themeModeLight
          ? _value.themeModeLight
          : themeModeLight // ignore: cast_nullable_to_non_nullable
              as bool?,
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeUsageLogImpl implements _ThemeUsageLog {
  const _$ThemeUsageLogImpl(
      {this.isBlack = null,
      this.themeModeLight = null,
      required this.themeName});

  factory _$ThemeUsageLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeUsageLogImplFromJson(json);

  @override
  @JsonKey()
  final bool? isBlack;
  @override
  @JsonKey()
  final bool? themeModeLight;
  @override
  final String themeName;

  @override
  String toString() {
    return 'ThemeUsageLog(isBlack: $isBlack, themeModeLight: $themeModeLight, themeName: $themeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeUsageLogImpl &&
            (identical(other.isBlack, isBlack) || other.isBlack == isBlack) &&
            (identical(other.themeModeLight, themeModeLight) ||
                other.themeModeLight == themeModeLight) &&
            (identical(other.themeName, themeName) ||
                other.themeName == themeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isBlack, themeModeLight, themeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeUsageLogImplCopyWith<_$ThemeUsageLogImpl> get copyWith =>
      __$$ThemeUsageLogImplCopyWithImpl<_$ThemeUsageLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeUsageLogImplToJson(
      this,
    );
  }
}

abstract class _ThemeUsageLog implements ThemeUsageLog {
  const factory _ThemeUsageLog(
      {final bool? isBlack,
      final bool? themeModeLight,
      required final String themeName}) = _$ThemeUsageLogImpl;

  factory _ThemeUsageLog.fromJson(Map<String, dynamic> json) =
      _$ThemeUsageLogImpl.fromJson;

  @override
  bool? get isBlack;
  @override
  bool? get themeModeLight;
  @override
  String get themeName;
  @override
  @JsonKey(ignore: true)
  _$$ThemeUsageLogImplCopyWith<_$ThemeUsageLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
