// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeTable _$TimeTableFromJson(Map<String, dynamic> json) {
  return _TimeTable.fromJson(json);
}

/// @nodoc
mixin _$TimeTable {
  List<Day> get week => throw _privateConstructorUsedError;
  String get batch => throw _privateConstructorUsedError;
  int get semester => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeTableCopyWith<TimeTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeTableCopyWith<$Res> {
  factory $TimeTableCopyWith(TimeTable value, $Res Function(TimeTable) then) =
      _$TimeTableCopyWithImpl<$Res, TimeTable>;
  @useResult
  $Res call({List<Day> week, String batch, int semester});
}

/// @nodoc
class _$TimeTableCopyWithImpl<$Res, $Val extends TimeTable>
    implements $TimeTableCopyWith<$Res> {
  _$TimeTableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? batch = null,
    Object? semester = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeTableImplCopyWith<$Res>
    implements $TimeTableCopyWith<$Res> {
  factory _$$TimeTableImplCopyWith(
          _$TimeTableImpl value, $Res Function(_$TimeTableImpl) then) =
      __$$TimeTableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Day> week, String batch, int semester});
}

/// @nodoc
class __$$TimeTableImplCopyWithImpl<$Res>
    extends _$TimeTableCopyWithImpl<$Res, _$TimeTableImpl>
    implements _$$TimeTableImplCopyWith<$Res> {
  __$$TimeTableImplCopyWithImpl(
      _$TimeTableImpl _value, $Res Function(_$TimeTableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? batch = null,
    Object? semester = null,
  }) {
    return _then(_$TimeTableImpl(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeTableImpl implements _TimeTable {
  const _$TimeTableImpl(
      {required this.week, required this.batch, required this.semester});

  factory _$TimeTableImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeTableImplFromJson(json);

  @override
  final List<Day> week;
  @override
  final String batch;
  @override
  final int semester;

  @override
  String toString() {
    return 'TimeTable(week: $week, batch: $batch, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeTableImpl &&
            const DeepCollectionEquality().equals(other.week, week) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(week), batch, semester);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeTableImplCopyWith<_$TimeTableImpl> get copyWith =>
      __$$TimeTableImplCopyWithImpl<_$TimeTableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeTableImplToJson(
      this,
    );
  }
}

abstract class _TimeTable implements TimeTable {
  const factory _TimeTable(
      {required final List<Day> week,
      required final String batch,
      required final int semester}) = _$TimeTableImpl;

  factory _TimeTable.fromJson(Map<String, dynamic> json) =
      _$TimeTableImpl.fromJson;

  @override
  List<Day> get week;
  @override
  String get batch;
  @override
  int get semester;
  @override
  @JsonKey(ignore: true)
  _$$TimeTableImplCopyWith<_$TimeTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Day _$DayFromJson(Map<String, dynamic> json) {
  return _Day.fromJson(json);
}

/// @nodoc
mixin _$Day {
  String get day => throw _privateConstructorUsedError;
  List<Subject> get subjects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayCopyWith<Day> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayCopyWith<$Res> {
  factory $DayCopyWith(Day value, $Res Function(Day) then) =
      _$DayCopyWithImpl<$Res, Day>;
  @useResult
  $Res call({String day, List<Subject> subjects});
}

/// @nodoc
class _$DayCopyWithImpl<$Res, $Val extends Day> implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? subjects = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayImplCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$$DayImplCopyWith(_$DayImpl value, $Res Function(_$DayImpl) then) =
      __$$DayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, List<Subject> subjects});
}

/// @nodoc
class __$$DayImplCopyWithImpl<$Res> extends _$DayCopyWithImpl<$Res, _$DayImpl>
    implements _$$DayImplCopyWith<$Res> {
  __$$DayImplCopyWithImpl(_$DayImpl _value, $Res Function(_$DayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? subjects = null,
  }) {
    return _then(_$DayImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayImpl implements _Day {
  const _$DayImpl({required this.day, required this.subjects});

  factory _$DayImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayImplFromJson(json);

  @override
  final String day;
  @override
  final List<Subject> subjects;

  @override
  String toString() {
    return 'Day(day: $day, subjects: $subjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayImpl &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality().equals(other.subjects, subjects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, day, const DeepCollectionEquality().hash(subjects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayImplCopyWith<_$DayImpl> get copyWith =>
      __$$DayImplCopyWithImpl<_$DayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayImplToJson(
      this,
    );
  }
}

abstract class _Day implements Day {
  const factory _Day(
      {required final String day,
      required final List<Subject> subjects}) = _$DayImpl;

  factory _Day.fromJson(Map<String, dynamic> json) = _$DayImpl.fromJson;

  @override
  String get day;
  @override
  List<Subject> get subjects;
  @override
  @JsonKey(ignore: true)
  _$$DayImplCopyWith<_$DayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  String get subjectName => throw _privateConstructorUsedError;
  String? get roomNo => throw _privateConstructorUsedError;
  dynamic get isElective => throw _privateConstructorUsedError;
  String? get electiveSubjectCode => throw _privateConstructorUsedError;
  String? get teacherName => throw _privateConstructorUsedError;
  DayTime get startTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call(
      {String subjectName,
      String? roomNo,
      dynamic isElective,
      String? electiveSubjectCode,
      String? teacherName,
      DayTime startTime});

  $DayTimeCopyWith<$Res> get startTime;
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectName = null,
    Object? roomNo = freezed,
    Object? isElective = freezed,
    Object? electiveSubjectCode = freezed,
    Object? teacherName = freezed,
    Object? startTime = null,
  }) {
    return _then(_value.copyWith(
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      roomNo: freezed == roomNo
          ? _value.roomNo
          : roomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isElective: freezed == isElective
          ? _value.isElective
          : isElective // ignore: cast_nullable_to_non_nullable
              as dynamic,
      electiveSubjectCode: freezed == electiveSubjectCode
          ? _value.electiveSubjectCode
          : electiveSubjectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DayTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DayTimeCopyWith<$Res> get startTime {
    return $DayTimeCopyWith<$Res>(_value.startTime, (value) {
      return _then(_value.copyWith(startTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubjectImplCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$SubjectImplCopyWith(
          _$SubjectImpl value, $Res Function(_$SubjectImpl) then) =
      __$$SubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subjectName,
      String? roomNo,
      dynamic isElective,
      String? electiveSubjectCode,
      String? teacherName,
      DayTime startTime});

  @override
  $DayTimeCopyWith<$Res> get startTime;
}

/// @nodoc
class __$$SubjectImplCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$SubjectImpl>
    implements _$$SubjectImplCopyWith<$Res> {
  __$$SubjectImplCopyWithImpl(
      _$SubjectImpl _value, $Res Function(_$SubjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectName = null,
    Object? roomNo = freezed,
    Object? isElective = freezed,
    Object? electiveSubjectCode = freezed,
    Object? teacherName = freezed,
    Object? startTime = null,
  }) {
    return _then(_$SubjectImpl(
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      roomNo: freezed == roomNo
          ? _value.roomNo
          : roomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isElective: freezed == isElective ? _value.isElective! : isElective,
      electiveSubjectCode: freezed == electiveSubjectCode
          ? _value.electiveSubjectCode
          : electiveSubjectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DayTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectImpl implements _Subject {
  const _$SubjectImpl(
      {required this.subjectName,
      this.roomNo = null,
      this.isElective = false,
      this.electiveSubjectCode = null,
      this.teacherName = null,
      required this.startTime});

  factory _$SubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectImplFromJson(json);

  @override
  final String subjectName;
  @override
  @JsonKey()
  final String? roomNo;
  @override
  @JsonKey()
  final dynamic isElective;
  @override
  @JsonKey()
  final String? electiveSubjectCode;
  @override
  @JsonKey()
  final String? teacherName;
  @override
  final DayTime startTime;

  @override
  String toString() {
    return 'Subject(subjectName: $subjectName, roomNo: $roomNo, isElective: $isElective, electiveSubjectCode: $electiveSubjectCode, teacherName: $teacherName, startTime: $startTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectImpl &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.roomNo, roomNo) || other.roomNo == roomNo) &&
            const DeepCollectionEquality()
                .equals(other.isElective, isElective) &&
            (identical(other.electiveSubjectCode, electiveSubjectCode) ||
                other.electiveSubjectCode == electiveSubjectCode) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      subjectName,
      roomNo,
      const DeepCollectionEquality().hash(isElective),
      electiveSubjectCode,
      teacherName,
      startTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      __$$SubjectImplCopyWithImpl<_$SubjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectImplToJson(
      this,
    );
  }
}

abstract class _Subject implements Subject {
  const factory _Subject(
      {required final String subjectName,
      final String? roomNo,
      final dynamic isElective,
      final String? electiveSubjectCode,
      final String? teacherName,
      required final DayTime startTime}) = _$SubjectImpl;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$SubjectImpl.fromJson;

  @override
  String get subjectName;
  @override
  String? get roomNo;
  @override
  dynamic get isElective;
  @override
  String? get electiveSubjectCode;
  @override
  String? get teacherName;
  @override
  DayTime get startTime;
  @override
  @JsonKey(ignore: true)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DayTime _$DayTimeFromJson(Map<String, dynamic> json) {
  return _DayTime.fromJson(json);
}

/// @nodoc
mixin _$DayTime {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayTimeCopyWith<DayTime> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayTimeCopyWith<$Res> {
  factory $DayTimeCopyWith(DayTime value, $Res Function(DayTime) then) =
      _$DayTimeCopyWithImpl<$Res, DayTime>;
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class _$DayTimeCopyWithImpl<$Res, $Val extends DayTime>
    implements $DayTimeCopyWith<$Res> {
  _$DayTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayTimeImplCopyWith<$Res> implements $DayTimeCopyWith<$Res> {
  factory _$$DayTimeImplCopyWith(
          _$DayTimeImpl value, $Res Function(_$DayTimeImpl) then) =
      __$$DayTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$DayTimeImplCopyWithImpl<$Res>
    extends _$DayTimeCopyWithImpl<$Res, _$DayTimeImpl>
    implements _$$DayTimeImplCopyWith<$Res> {
  __$$DayTimeImplCopyWithImpl(
      _$DayTimeImpl _value, $Res Function(_$DayTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$DayTimeImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayTimeImpl implements _DayTime {
  const _$DayTimeImpl({required this.hour, required this.minute});

  factory _$DayTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayTimeImplFromJson(json);

  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'DayTime(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayTimeImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayTimeImplCopyWith<_$DayTimeImpl> get copyWith =>
      __$$DayTimeImplCopyWithImpl<_$DayTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayTimeImplToJson(
      this,
    );
  }
}

abstract class _DayTime implements DayTime {
  const factory _DayTime({required final int hour, required final int minute}) =
      _$DayTimeImpl;

  factory _DayTime.fromJson(Map<String, dynamic> json) = _$DayTimeImpl.fromJson;

  @override
  int get hour;
  @override
  int get minute;
  @override
  @JsonKey(ignore: true)
  _$$DayTimeImplCopyWith<_$DayTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
