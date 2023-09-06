// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubjectInfo {
  Subject get subject => throw _privateConstructorUsedError;
  int get currentWeek => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubjectInfoCopyWith<SubjectInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectInfoCopyWith<$Res> {
  factory $SubjectInfoCopyWith(
          SubjectInfo value, $Res Function(SubjectInfo) then) =
      _$SubjectInfoCopyWithImpl<$Res, SubjectInfo>;
  @useResult
  $Res call({Subject subject, int currentWeek});

  $SubjectCopyWith<$Res> get subject;
}

/// @nodoc
class _$SubjectInfoCopyWithImpl<$Res, $Val extends SubjectInfo>
    implements $SubjectInfoCopyWith<$Res> {
  _$SubjectInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? currentWeek = null,
  }) {
    return _then(_value.copyWith(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      currentWeek: null == currentWeek
          ? _value.currentWeek
          : currentWeek // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectCopyWith<$Res> get subject {
    return $SubjectCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubjectInfoCopyWith<$Res>
    implements $SubjectInfoCopyWith<$Res> {
  factory _$$_SubjectInfoCopyWith(
          _$_SubjectInfo value, $Res Function(_$_SubjectInfo) then) =
      __$$_SubjectInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Subject subject, int currentWeek});

  @override
  $SubjectCopyWith<$Res> get subject;
}

/// @nodoc
class __$$_SubjectInfoCopyWithImpl<$Res>
    extends _$SubjectInfoCopyWithImpl<$Res, _$_SubjectInfo>
    implements _$$_SubjectInfoCopyWith<$Res> {
  __$$_SubjectInfoCopyWithImpl(
      _$_SubjectInfo _value, $Res Function(_$_SubjectInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? currentWeek = null,
  }) {
    return _then(_$_SubjectInfo(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      currentWeek: null == currentWeek
          ? _value.currentWeek
          : currentWeek // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SubjectInfo implements _SubjectInfo {
  const _$_SubjectInfo({required this.subject, required this.currentWeek});

  @override
  final Subject subject;
  @override
  final int currentWeek;

  @override
  String toString() {
    return 'SubjectInfo(subject: $subject, currentWeek: $currentWeek)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubjectInfo &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.currentWeek, currentWeek) ||
                other.currentWeek == currentWeek));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subject, currentWeek);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubjectInfoCopyWith<_$_SubjectInfo> get copyWith =>
      __$$_SubjectInfoCopyWithImpl<_$_SubjectInfo>(this, _$identity);
}

abstract class _SubjectInfo implements SubjectInfo {
  const factory _SubjectInfo(
      {required final Subject subject,
      required final int currentWeek}) = _$_SubjectInfo;

  @override
  Subject get subject;
  @override
  int get currentWeek;
  @override
  @JsonKey(ignore: true)
  _$$_SubjectInfoCopyWith<_$_SubjectInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
