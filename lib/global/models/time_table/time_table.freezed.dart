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
  String get creatorId => throw _privateConstructorUsedError;
  String get batch => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get slot => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

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
  $Res call(
      {List<Day> week,
      String creatorId,
      String batch,
      int year,
      int slot,
      DateTime date});
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
    Object? creatorId = null,
    Object? batch = null,
    Object? year = null,
    Object? slot = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeTableCopyWith<$Res> implements $TimeTableCopyWith<$Res> {
  factory _$$_TimeTableCopyWith(
          _$_TimeTable value, $Res Function(_$_TimeTable) then) =
      __$$_TimeTableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Day> week,
      String creatorId,
      String batch,
      int year,
      int slot,
      DateTime date});
}

/// @nodoc
class __$$_TimeTableCopyWithImpl<$Res>
    extends _$TimeTableCopyWithImpl<$Res, _$_TimeTable>
    implements _$$_TimeTableCopyWith<$Res> {
  __$$_TimeTableCopyWithImpl(
      _$_TimeTable _value, $Res Function(_$_TimeTable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? creatorId = null,
    Object? batch = null,
    Object? year = null,
    Object? slot = null,
    Object? date = null,
  }) {
    return _then(_$_TimeTable(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
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
class _$_TimeTable implements _TimeTable {
  const _$_TimeTable(
      {required this.week,
      required this.creatorId,
      required this.batch,
      required this.year,
      required this.slot,
      required this.date});

  factory _$_TimeTable.fromJson(Map<String, dynamic> json) =>
      _$$_TimeTableFromJson(json);

  @override
  final List<Day> week;
  @override
  final String creatorId;
  @override
  final String batch;
  @override
  final int year;
  @override
  final int slot;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'TimeTable(week: $week, creatorId: $creatorId, batch: $batch, year: $year, slot: $slot, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeTable &&
            const DeepCollectionEquality().equals(other.week, week) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(week),
      creatorId,
      batch,
      year,
      slot,
      date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeTableCopyWith<_$_TimeTable> get copyWith =>
      __$$_TimeTableCopyWithImpl<_$_TimeTable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeTableToJson(
      this,
    );
  }
}

abstract class _TimeTable implements TimeTable {
  const factory _TimeTable(
      {required final List<Day> week,
      required final String creatorId,
      required final String batch,
      required final int year,
      required final int slot,
      required final DateTime date}) = _$_TimeTable;

  factory _TimeTable.fromJson(Map<String, dynamic> json) =
      _$_TimeTable.fromJson;

  @override
  List<Day> get week;
  @override
  String get creatorId;
  @override
  String get batch;
  @override
  int get year;
  @override
  int get slot;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_TimeTableCopyWith<_$_TimeTable> get copyWith =>
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
abstract class _$$_DayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$$_DayCopyWith(_$_Day value, $Res Function(_$_Day) then) =
      __$$_DayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, List<Subject> subjects});
}

/// @nodoc
class __$$_DayCopyWithImpl<$Res> extends _$DayCopyWithImpl<$Res, _$_Day>
    implements _$$_DayCopyWith<$Res> {
  __$$_DayCopyWithImpl(_$_Day _value, $Res Function(_$_Day) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? subjects = null,
  }) {
    return _then(_$_Day(
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
class _$_Day implements _Day {
  const _$_Day({required this.day, required this.subjects});

  factory _$_Day.fromJson(Map<String, dynamic> json) => _$$_DayFromJson(json);

  @override
  final String day;
  @override
  final List<Subject> subjects;

  @override
  String toString() {
    return 'Day(day: $day, subjects: $subjects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Day &&
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
  _$$_DayCopyWith<_$_Day> get copyWith =>
      __$$_DayCopyWithImpl<_$_Day>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayToJson(
      this,
    );
  }
}

abstract class _Day implements Day {
  const factory _Day(
      {required final String day,
      required final List<Subject> subjects}) = _$_Day;

  factory _Day.fromJson(Map<String, dynamic> json) = _$_Day.fromJson;

  @override
  String get day;
  @override
  List<Subject> get subjects;
  @override
  @JsonKey(ignore: true)
  _$$_DayCopyWith<_$_Day> get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$_SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$_SubjectCopyWith(
          _$_Subject value, $Res Function(_$_Subject) then) =
      __$$_SubjectCopyWithImpl<$Res>;
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
class __$$_SubjectCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$_Subject>
    implements _$$_SubjectCopyWith<$Res> {
  __$$_SubjectCopyWithImpl(_$_Subject _value, $Res Function(_$_Subject) _then)
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
    return _then(_$_Subject(
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
class _$_Subject implements _Subject {
  const _$_Subject(
      {required this.subjectName,
      this.roomNo = null,
      this.isElective = false,
      this.electiveSubjectCode = null,
      this.teacherName = null,
      required this.startTime});

  factory _$_Subject.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subject &&
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
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
      __$$_SubjectCopyWithImpl<_$_Subject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectToJson(
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
      required final DayTime startTime}) = _$_Subject;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$_Subject.fromJson;

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
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
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
abstract class _$$_DayTimeCopyWith<$Res> implements $DayTimeCopyWith<$Res> {
  factory _$$_DayTimeCopyWith(
          _$_DayTime value, $Res Function(_$_DayTime) then) =
      __$$_DayTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$_DayTimeCopyWithImpl<$Res>
    extends _$DayTimeCopyWithImpl<$Res, _$_DayTime>
    implements _$$_DayTimeCopyWith<$Res> {
  __$$_DayTimeCopyWithImpl(_$_DayTime _value, $Res Function(_$_DayTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$_DayTime(
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
class _$_DayTime implements _DayTime {
  const _$_DayTime({required this.hour, required this.minute});

  factory _$_DayTime.fromJson(Map<String, dynamic> json) =>
      _$$_DayTimeFromJson(json);

  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'DayTime(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DayTime &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DayTimeCopyWith<_$_DayTime> get copyWith =>
      __$$_DayTimeCopyWithImpl<_$_DayTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayTimeToJson(
      this,
    );
  }
}

abstract class _DayTime implements DayTime {
  const factory _DayTime({required final int hour, required final int minute}) =
      _$_DayTime;

  factory _DayTime.fromJson(Map<String, dynamic> json) = _$_DayTime.fromJson;

  @override
  int get hour;
  @override
  int get minute;
  @override
  @JsonKey(ignore: true)
  _$$_DayTimeCopyWith<_$_DayTime> get copyWith =>
      throw _privateConstructorUsedError;
}
