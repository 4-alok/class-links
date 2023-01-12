// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$TimeTableCopyWithImpl<$Res>;
  $Res call(
      {List<Day> week,
      String creatorId,
      String batch,
      int year,
      int slot,
      DateTime date});
}

/// @nodoc
class _$TimeTableCopyWithImpl<$Res> implements $TimeTableCopyWith<$Res> {
  _$TimeTableCopyWithImpl(this._value, this._then);

  final TimeTable _value;
  // ignore: unused_field
  final $Res Function(TimeTable) _then;

  @override
  $Res call({
    Object? week = freezed,
    Object? creatorId = freezed,
    Object? batch = freezed,
    Object? year = freezed,
    Object? slot = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      slot: slot == freezed
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_TimeTableCopyWith<$Res> implements $TimeTableCopyWith<$Res> {
  factory _$$_TimeTableCopyWith(
          _$_TimeTable value, $Res Function(_$_TimeTable) then) =
      __$$_TimeTableCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Day> week,
      String creatorId,
      String batch,
      int year,
      int slot,
      DateTime date});
}

/// @nodoc
class __$$_TimeTableCopyWithImpl<$Res> extends _$TimeTableCopyWithImpl<$Res>
    implements _$$_TimeTableCopyWith<$Res> {
  __$$_TimeTableCopyWithImpl(
      _$_TimeTable _value, $Res Function(_$_TimeTable) _then)
      : super(_value, (v) => _then(v as _$_TimeTable));

  @override
  _$_TimeTable get _value => super._value as _$_TimeTable;

  @override
  $Res call({
    Object? week = freezed,
    Object? creatorId = freezed,
    Object? batch = freezed,
    Object? year = freezed,
    Object? slot = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_TimeTable(
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      slot: slot == freezed
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
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
            const DeepCollectionEquality().equals(other.creatorId, creatorId) &&
            const DeepCollectionEquality().equals(other.batch, batch) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.slot, slot) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(week),
      const DeepCollectionEquality().hash(creatorId),
      const DeepCollectionEquality().hash(batch),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(slot),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
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
      _$DayCopyWithImpl<$Res>;
  $Res call({String day, List<Subject> subjects});
}

/// @nodoc
class _$DayCopyWithImpl<$Res> implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._value, this._then);

  final Day _value;
  // ignore: unused_field
  final $Res Function(Day) _then;

  @override
  $Res call({
    Object? day = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>,
    ));
  }
}

/// @nodoc
abstract class _$$_DayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$$_DayCopyWith(_$_Day value, $Res Function(_$_Day) then) =
      __$$_DayCopyWithImpl<$Res>;
  @override
  $Res call({String day, List<Subject> subjects});
}

/// @nodoc
class __$$_DayCopyWithImpl<$Res> extends _$DayCopyWithImpl<$Res>
    implements _$$_DayCopyWith<$Res> {
  __$$_DayCopyWithImpl(_$_Day _value, $Res Function(_$_Day) _then)
      : super(_value, (v) => _then(v as _$_Day));

  @override
  _$_Day get _value => super._value as _$_Day;

  @override
  $Res call({
    Object? day = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_$_Day(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: subjects == freezed
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
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.subjects, subjects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(subjects));

  @JsonKey(ignore: true)
  @override
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
      _$SubjectCopyWithImpl<$Res>;
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
class _$SubjectCopyWithImpl<$Res> implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  final Subject _value;
  // ignore: unused_field
  final $Res Function(Subject) _then;

  @override
  $Res call({
    Object? subjectName = freezed,
    Object? roomNo = freezed,
    Object? isElective = freezed,
    Object? electiveSubjectCode = freezed,
    Object? teacherName = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_value.copyWith(
      subjectName: subjectName == freezed
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      roomNo: roomNo == freezed
          ? _value.roomNo
          : roomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isElective: isElective == freezed
          ? _value.isElective
          : isElective // ignore: cast_nullable_to_non_nullable
              as dynamic,
      electiveSubjectCode: electiveSubjectCode == freezed
          ? _value.electiveSubjectCode
          : electiveSubjectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: teacherName == freezed
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DayTime,
    ));
  }

  @override
  $DayTimeCopyWith<$Res> get startTime {
    return $DayTimeCopyWith<$Res>(_value.startTime, (value) {
      return _then(_value.copyWith(startTime: value));
    });
  }
}

/// @nodoc
abstract class _$$_SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$_SubjectCopyWith(
          _$_Subject value, $Res Function(_$_Subject) then) =
      __$$_SubjectCopyWithImpl<$Res>;
  @override
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
class __$$_SubjectCopyWithImpl<$Res> extends _$SubjectCopyWithImpl<$Res>
    implements _$$_SubjectCopyWith<$Res> {
  __$$_SubjectCopyWithImpl(_$_Subject _value, $Res Function(_$_Subject) _then)
      : super(_value, (v) => _then(v as _$_Subject));

  @override
  _$_Subject get _value => super._value as _$_Subject;

  @override
  $Res call({
    Object? subjectName = freezed,
    Object? roomNo = freezed,
    Object? isElective = freezed,
    Object? electiveSubjectCode = freezed,
    Object? teacherName = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_$_Subject(
      subjectName: subjectName == freezed
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      roomNo: roomNo == freezed
          ? _value.roomNo
          : roomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isElective: isElective == freezed ? _value.isElective : isElective,
      electiveSubjectCode: electiveSubjectCode == freezed
          ? _value.electiveSubjectCode
          : electiveSubjectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: teacherName == freezed
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: startTime == freezed
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
            const DeepCollectionEquality()
                .equals(other.subjectName, subjectName) &&
            const DeepCollectionEquality().equals(other.roomNo, roomNo) &&
            const DeepCollectionEquality()
                .equals(other.isElective, isElective) &&
            const DeepCollectionEquality()
                .equals(other.electiveSubjectCode, electiveSubjectCode) &&
            const DeepCollectionEquality()
                .equals(other.teacherName, teacherName) &&
            const DeepCollectionEquality().equals(other.startTime, startTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(subjectName),
      const DeepCollectionEquality().hash(roomNo),
      const DeepCollectionEquality().hash(isElective),
      const DeepCollectionEquality().hash(electiveSubjectCode),
      const DeepCollectionEquality().hash(teacherName),
      const DeepCollectionEquality().hash(startTime));

  @JsonKey(ignore: true)
  @override
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
      _$DayTimeCopyWithImpl<$Res>;
  $Res call({int hour, int minute});
}

/// @nodoc
class _$DayTimeCopyWithImpl<$Res> implements $DayTimeCopyWith<$Res> {
  _$DayTimeCopyWithImpl(this._value, this._then);

  final DayTime _value;
  // ignore: unused_field
  final $Res Function(DayTime) _then;

  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
  }) {
    return _then(_value.copyWith(
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: minute == freezed
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DayTimeCopyWith<$Res> implements $DayTimeCopyWith<$Res> {
  factory _$$_DayTimeCopyWith(
          _$_DayTime value, $Res Function(_$_DayTime) then) =
      __$$_DayTimeCopyWithImpl<$Res>;
  @override
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$_DayTimeCopyWithImpl<$Res> extends _$DayTimeCopyWithImpl<$Res>
    implements _$$_DayTimeCopyWith<$Res> {
  __$$_DayTimeCopyWithImpl(_$_DayTime _value, $Res Function(_$_DayTime) _then)
      : super(_value, (v) => _then(v as _$_DayTime));

  @override
  _$_DayTime get _value => super._value as _$_DayTime;

  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
  }) {
    return _then(_$_DayTime(
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: minute == freezed
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
            const DeepCollectionEquality().equals(other.hour, hour) &&
            const DeepCollectionEquality().equals(other.minute, minute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hour),
      const DeepCollectionEquality().hash(minute));

  @JsonKey(ignore: true)
  @override
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
