// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationPayload _$NotificationPayloadFromJson(Map<String, dynamic> json) {
  return _NotificationPayload.fromJson(json);
}

/// @nodoc
class _$NotificationPayloadTearOff {
  const _$NotificationPayloadTearOff();

  _NotificationPayload call(
      {required String title,
      required String body,
      LinkType? type = null,
      required DayTime time,
      String? roomNo = null,
      Subject? subject = null}) {
    return _NotificationPayload(
      title: title,
      body: body,
      type: type,
      time: time,
      roomNo: roomNo,
      subject: subject,
    );
  }

  NotificationPayload fromJson(Map<String, Object?> json) {
    return NotificationPayload.fromJson(json);
  }
}

/// @nodoc
const $NotificationPayload = _$NotificationPayloadTearOff();

/// @nodoc
mixin _$NotificationPayload {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  LinkType? get type => throw _privateConstructorUsedError;
  DayTime get time => throw _privateConstructorUsedError;
  String? get roomNo => throw _privateConstructorUsedError;
  Subject? get subject => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPayloadCopyWith<NotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPayloadCopyWith<$Res> {
  factory $NotificationPayloadCopyWith(
          NotificationPayload value, $Res Function(NotificationPayload) then) =
      _$NotificationPayloadCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String body,
      LinkType? type,
      DayTime time,
      String? roomNo,
      Subject? subject});

  $DayTimeCopyWith<$Res> get time;
  $SubjectCopyWith<$Res>? get subject;
}

/// @nodoc
class _$NotificationPayloadCopyWithImpl<$Res>
    implements $NotificationPayloadCopyWith<$Res> {
  _$NotificationPayloadCopyWithImpl(this._value, this._then);

  final NotificationPayload _value;
  // ignore: unused_field
  final $Res Function(NotificationPayload) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? type = freezed,
    Object? time = freezed,
    Object? roomNo = freezed,
    Object? subject = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LinkType?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DayTime,
      roomNo: roomNo == freezed
          ? _value.roomNo
          : roomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject?,
    ));
  }

  @override
  $DayTimeCopyWith<$Res> get time {
    return $DayTimeCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value));
    });
  }

  @override
  $SubjectCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $SubjectCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationPayloadCopyWith<$Res>
    implements $NotificationPayloadCopyWith<$Res> {
  factory _$NotificationPayloadCopyWith(_NotificationPayload value,
          $Res Function(_NotificationPayload) then) =
      __$NotificationPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String body,
      LinkType? type,
      DayTime time,
      String? roomNo,
      Subject? subject});

  @override
  $DayTimeCopyWith<$Res> get time;
  @override
  $SubjectCopyWith<$Res>? get subject;
}

/// @nodoc
class __$NotificationPayloadCopyWithImpl<$Res>
    extends _$NotificationPayloadCopyWithImpl<$Res>
    implements _$NotificationPayloadCopyWith<$Res> {
  __$NotificationPayloadCopyWithImpl(
      _NotificationPayload _value, $Res Function(_NotificationPayload) _then)
      : super(_value, (v) => _then(v as _NotificationPayload));

  @override
  _NotificationPayload get _value => super._value as _NotificationPayload;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? type = freezed,
    Object? time = freezed,
    Object? roomNo = freezed,
    Object? subject = freezed,
  }) {
    return _then(_NotificationPayload(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LinkType?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DayTime,
      roomNo: roomNo == freezed
          ? _value.roomNo
          : roomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationPayload implements _NotificationPayload {
  const _$_NotificationPayload(
      {required this.title,
      required this.body,
      this.type = null,
      required this.time,
      this.roomNo = null,
      this.subject = null});

  factory _$_NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationPayloadFromJson(json);

  @override
  final String title;
  @override
  final String body;
  @JsonKey()
  @override
  final LinkType? type;
  @override
  final DayTime time;
  @JsonKey()
  @override
  final String? roomNo;
  @JsonKey()
  @override
  final Subject? subject;

  @override
  String toString() {
    return 'NotificationPayload(title: $title, body: $body, type: $type, time: $time, roomNo: $roomNo, subject: $subject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationPayload &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.roomNo, roomNo) &&
            const DeepCollectionEquality().equals(other.subject, subject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(roomNo),
      const DeepCollectionEquality().hash(subject));

  @JsonKey(ignore: true)
  @override
  _$NotificationPayloadCopyWith<_NotificationPayload> get copyWith =>
      __$NotificationPayloadCopyWithImpl<_NotificationPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationPayloadToJson(this);
  }
}

abstract class _NotificationPayload implements NotificationPayload {
  const factory _NotificationPayload(
      {required String title,
      required String body,
      LinkType? type,
      required DayTime time,
      String? roomNo,
      Subject? subject}) = _$_NotificationPayload;

  factory _NotificationPayload.fromJson(Map<String, dynamic> json) =
      _$_NotificationPayload.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  LinkType? get type;
  @override
  DayTime get time;
  @override
  String? get roomNo;
  @override
  Subject? get subject;
  @override
  @JsonKey(ignore: true)
  _$NotificationPayloadCopyWith<_NotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
