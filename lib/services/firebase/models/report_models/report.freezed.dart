// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$ReportCopyWithImpl<$Res>;
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
class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  final Report _value;
  // ignore: unused_field
  final $Res Function(Report) _then;

  @override
  $Res call({
    Object? docId = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? reportType = freezed,
    Object? description = freezed,
    Object? dateTime = freezed,
    Object? attatchmentUrl = freezed,
    Object? reply = freezed,
  }) {
    return _then(_value.copyWith(
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reportType: reportType == freezed
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as ReportType,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attatchmentUrl: attatchmentUrl == freezed
          ? _value.attatchmentUrl
          : attatchmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reply: reply == freezed
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$_ReportCopyWith(_$_Report value, $Res Function(_$_Report) then) =
      __$$_ReportCopyWithImpl<$Res>;
  @override
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
class __$$_ReportCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$$_ReportCopyWith<$Res> {
  __$$_ReportCopyWithImpl(_$_Report _value, $Res Function(_$_Report) _then)
      : super(_value, (v) => _then(v as _$_Report));

  @override
  _$_Report get _value => super._value as _$_Report;

  @override
  $Res call({
    Object? docId = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? reportType = freezed,
    Object? description = freezed,
    Object? dateTime = freezed,
    Object? attatchmentUrl = freezed,
    Object? reply = freezed,
  }) {
    return _then(_$_Report(
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reportType: reportType == freezed
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as ReportType,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attatchmentUrl: attatchmentUrl == freezed
          ? _value.attatchmentUrl
          : attatchmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reply: reply == freezed
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Report implements _Report {
  const _$_Report(
      {this.docId = null,
      required this.id,
      required this.userId,
      required this.reportType,
      required this.description,
      required this.dateTime,
      this.attatchmentUrl = null,
      this.reply = null});

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Report &&
            const DeepCollectionEquality().equals(other.docId, docId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.reportType, reportType) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality()
                .equals(other.attatchmentUrl, attatchmentUrl) &&
            const DeepCollectionEquality().equals(other.reply, reply));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(docId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(reportType),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(attatchmentUrl),
      const DeepCollectionEquality().hash(reply));

  @JsonKey(ignore: true)
  @override
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      __$$_ReportCopyWithImpl<_$_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportToJson(
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
      final String? reply}) = _$_Report;

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

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
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      throw _privateConstructorUsedError;
}
