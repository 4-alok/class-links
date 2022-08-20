// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get refId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  List<int> get interested => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  String? get launchURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {String refId,
      String title,
      String description,
      String creatorId,
      String imgUrl,
      String? logoUrl,
      DateTime dateTime,
      List<int> interested,
      bool verified,
      String? launchURL});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? refId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? creatorId = freezed,
    Object? imgUrl = freezed,
    Object? logoUrl = freezed,
    Object? dateTime = freezed,
    Object? interested = freezed,
    Object? verified = freezed,
    Object? launchURL = freezed,
  }) {
    return _then(_value.copyWith(
      refId: refId == freezed
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      interested: interested == freezed
          ? _value.interested
          : interested // ignore: cast_nullable_to_non_nullable
              as List<int>,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      launchURL: launchURL == freezed
          ? _value.launchURL
          : launchURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String refId,
      String title,
      String description,
      String creatorId,
      String imgUrl,
      String? logoUrl,
      DateTime dateTime,
      List<int> interested,
      bool verified,
      String? launchURL});
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, (v) => _then(v as _$_Event));

  @override
  _$_Event get _value => super._value as _$_Event;

  @override
  $Res call({
    Object? refId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? creatorId = freezed,
    Object? imgUrl = freezed,
    Object? logoUrl = freezed,
    Object? dateTime = freezed,
    Object? interested = freezed,
    Object? verified = freezed,
    Object? launchURL = freezed,
  }) {
    return _then(_$_Event(
      refId: refId == freezed
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      interested: interested == freezed
          ? _value._interested
          : interested // ignore: cast_nullable_to_non_nullable
              as List<int>,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      launchURL: launchURL == freezed
          ? _value.launchURL
          : launchURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  const _$_Event(
      {this.refId = "",
      required this.title,
      required this.description,
      required this.creatorId,
      required this.imgUrl,
      this.logoUrl = null,
      required this.dateTime,
      final List<int> interested = const [],
      required this.verified,
      this.launchURL = null})
      : _interested = interested;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  @JsonKey()
  final String refId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String creatorId;
  @override
  final String imgUrl;
  @override
  @JsonKey()
  final String? logoUrl;
  @override
  final DateTime dateTime;
  final List<int> _interested;
  @override
  @JsonKey()
  List<int> get interested {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interested);
  }

  @override
  final bool verified;
  @override
  @JsonKey()
  final String? launchURL;

  @override
  String toString() {
    return 'Event(refId: $refId, title: $title, description: $description, creatorId: $creatorId, imgUrl: $imgUrl, logoUrl: $logoUrl, dateTime: $dateTime, interested: $interested, verified: $verified, launchURL: $launchURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            const DeepCollectionEquality().equals(other.refId, refId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.creatorId, creatorId) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality().equals(other.logoUrl, logoUrl) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality()
                .equals(other._interested, _interested) &&
            const DeepCollectionEquality().equals(other.verified, verified) &&
            const DeepCollectionEquality().equals(other.launchURL, launchURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(refId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(creatorId),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(logoUrl),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(_interested),
      const DeepCollectionEquality().hash(verified),
      const DeepCollectionEquality().hash(launchURL));

  @JsonKey(ignore: true)
  @override
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {final String refId,
      required final String title,
      required final String description,
      required final String creatorId,
      required final String imgUrl,
      final String? logoUrl,
      required final DateTime dateTime,
      final List<int> interested,
      required final bool verified,
      final String? launchURL}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get refId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get creatorId;
  @override
  String get imgUrl;
  @override
  String? get logoUrl;
  @override
  DateTime get dateTime;
  @override
  List<int> get interested;
  @override
  bool get verified;
  @override
  String? get launchURL;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
