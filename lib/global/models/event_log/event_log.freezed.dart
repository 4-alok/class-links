// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventLog _$EventLogFromJson(Map<String, dynamic> json) {
  return _EventLog.fromJson(json);
}

/// @nodoc
mixin _$EventLog {
  int get eventCount => throw _privateConstructorUsedError;
  List<String> get refIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventLogCopyWith<EventLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventLogCopyWith<$Res> {
  factory $EventLogCopyWith(EventLog value, $Res Function(EventLog) then) =
      _$EventLogCopyWithImpl<$Res, EventLog>;
  @useResult
  $Res call({int eventCount, List<String> refIds});
}

/// @nodoc
class _$EventLogCopyWithImpl<$Res, $Val extends EventLog>
    implements $EventLogCopyWith<$Res> {
  _$EventLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventCount = null,
    Object? refIds = null,
  }) {
    return _then(_value.copyWith(
      eventCount: null == eventCount
          ? _value.eventCount
          : eventCount // ignore: cast_nullable_to_non_nullable
              as int,
      refIds: null == refIds
          ? _value.refIds
          : refIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventLogCopyWith<$Res> implements $EventLogCopyWith<$Res> {
  factory _$$_EventLogCopyWith(
          _$_EventLog value, $Res Function(_$_EventLog) then) =
      __$$_EventLogCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int eventCount, List<String> refIds});
}

/// @nodoc
class __$$_EventLogCopyWithImpl<$Res>
    extends _$EventLogCopyWithImpl<$Res, _$_EventLog>
    implements _$$_EventLogCopyWith<$Res> {
  __$$_EventLogCopyWithImpl(
      _$_EventLog _value, $Res Function(_$_EventLog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventCount = null,
    Object? refIds = null,
  }) {
    return _then(_$_EventLog(
      eventCount: null == eventCount
          ? _value.eventCount
          : eventCount // ignore: cast_nullable_to_non_nullable
              as int,
      refIds: null == refIds
          ? _value._refIds
          : refIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventLog implements _EventLog {
  const _$_EventLog(
      {required this.eventCount, final List<String> refIds = const []})
      : _refIds = refIds;

  factory _$_EventLog.fromJson(Map<String, dynamic> json) =>
      _$$_EventLogFromJson(json);

  @override
  final int eventCount;
  final List<String> _refIds;
  @override
  @JsonKey()
  List<String> get refIds {
    if (_refIds is EqualUnmodifiableListView) return _refIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_refIds);
  }

  @override
  String toString() {
    return 'EventLog(eventCount: $eventCount, refIds: $refIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventLog &&
            (identical(other.eventCount, eventCount) ||
                other.eventCount == eventCount) &&
            const DeepCollectionEquality().equals(other._refIds, _refIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, eventCount, const DeepCollectionEquality().hash(_refIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventLogCopyWith<_$_EventLog> get copyWith =>
      __$$_EventLogCopyWithImpl<_$_EventLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventLogToJson(
      this,
    );
  }
}

abstract class _EventLog implements EventLog {
  const factory _EventLog(
      {required final int eventCount, final List<String> refIds}) = _$_EventLog;

  factory _EventLog.fromJson(Map<String, dynamic> json) = _$_EventLog.fromJson;

  @override
  int get eventCount;
  @override
  List<String> get refIds;
  @override
  @JsonKey(ignore: true)
  _$$_EventLogCopyWith<_$_EventLog> get copyWith =>
      throw _privateConstructorUsedError;
}
