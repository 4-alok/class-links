// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String? get docId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  ReportType get reportType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String? get attatchmentUrl => throw _privateConstructorUsedError;
  String? get reply => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call(
      {String? docId,
      String id,
      String userId,
      ReportType reportType,
      String description,
      DateTime dateTime,
      String? attatchmentUrl,
      String? reply});
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? id = null,
    Object? userId = null,
    Object? reportType = null,
    Object? description = null,
    Object? dateTime = null,
    Object? attatchmentUrl = freezed,
    Object? reply = freezed,
  }) {
    return _then(_value.copyWith(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as ReportType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attatchmentUrl: freezed == attatchmentUrl
          ? _value.attatchmentUrl
          : attatchmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportImplCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$ReportImplCopyWith(
          _$ReportImpl value, $Res Function(_$ReportImpl) then) =
      __$$ReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? docId,
      String id,
      String userId,
      ReportType reportType,
      String description,
      DateTime dateTime,
      String? attatchmentUrl,
      String? reply});
}

/// @nodoc
class __$$ReportImplCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$ReportImpl>
    implements _$$ReportImplCopyWith<$Res> {
  __$$ReportImplCopyWithImpl(
      _$ReportImpl _value, $Res Function(_$ReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? id = null,
    Object? userId = null,
    Object? reportType = null,
    Object? description = null,
    Object? dateTime = null,
    Object? attatchmentUrl = freezed,
    Object? reply = freezed,
  }) {
    return _then(_$ReportImpl(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as ReportType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attatchmentUrl: freezed == attatchmentUrl
          ? _value.attatchmentUrl
          : attatchmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportImpl implements _Report {
  const _$ReportImpl(
      {this.docId = null,
      required this.id,
      required this.userId,
      required this.reportType,
      required this.description,
      required this.dateTime,
      this.attatchmentUrl = null,
      this.reply = null});

  factory _$ReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportImplFromJson(json);

  @override
  @JsonKey()
  final String? docId;
  @override
  final String id;
  @override
  final String userId;
  @override
  final ReportType reportType;
  @override
  final String description;
  @override
  final DateTime dateTime;
  @override
  @JsonKey()
  final String? attatchmentUrl;
  @override
  @JsonKey()
  final String? reply;

  @override
  String toString() {
    return 'Report(docId: $docId, id: $id, userId: $userId, reportType: $reportType, description: $description, dateTime: $dateTime, attatchmentUrl: $attatchmentUrl, reply: $reply)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.attatchmentUrl, attatchmentUrl) ||
                other.attatchmentUrl == attatchmentUrl) &&
            (identical(other.reply, reply) || other.reply == reply));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, docId, id, userId, reportType,
      description, dateTime, attatchmentUrl, reply);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      __$$ReportImplCopyWithImpl<_$ReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportImplToJson(
      this,
    );
  }
}

abstract class _Report implements Report {
  const factory _Report(
      {final String? docId,
      required final String id,
      required final String userId,
      required final ReportType reportType,
      required final String description,
      required final DateTime dateTime,
      final String? attatchmentUrl,
      final String? reply}) = _$ReportImpl;

  factory _Report.fromJson(Map<String, dynamic> json) = _$ReportImpl.fromJson;

  @override
  String? get docId;
  @override
  String get id;
  @override
  String get userId;
  @override
  ReportType get reportType;
  @override
  String get description;
  @override
  DateTime get dateTime;
  @override
  String? get attatchmentUrl;
  @override
  String? get reply;
  @override
  @JsonKey(ignore: true)
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
