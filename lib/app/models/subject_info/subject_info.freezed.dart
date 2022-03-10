// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subject_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SubjectInfoTearOff {
  const _$SubjectInfoTearOff();

  _SubjectInfo call({required Subject subject, required int currentWeek}) {
    return _SubjectInfo(
      subject: subject,
      currentWeek: currentWeek,
    );
  }
}

/// @nodoc
const $SubjectInfo = _$SubjectInfoTearOff();

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
      _$SubjectInfoCopyWithImpl<$Res>;
  $Res call({Subject subject, int currentWeek});

  $SubjectCopyWith<$Res> get subject;
}

/// @nodoc
class _$SubjectInfoCopyWithImpl<$Res> implements $SubjectInfoCopyWith<$Res> {
  _$SubjectInfoCopyWithImpl(this._value, this._then);

  final SubjectInfo _value;
  // ignore: unused_field
  final $Res Function(SubjectInfo) _then;

  @override
  $Res call({
    Object? subject = freezed,
    Object? currentWeek = freezed,
  }) {
    return _then(_value.copyWith(
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      currentWeek: currentWeek == freezed
          ? _value.currentWeek
          : currentWeek // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $SubjectCopyWith<$Res> get subject {
    return $SubjectCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value));
    });
  }
}

/// @nodoc
abstract class _$SubjectInfoCopyWith<$Res>
    implements $SubjectInfoCopyWith<$Res> {
  factory _$SubjectInfoCopyWith(
          _SubjectInfo value, $Res Function(_SubjectInfo) then) =
      __$SubjectInfoCopyWithImpl<$Res>;
  @override
  $Res call({Subject subject, int currentWeek});

  @override
  $SubjectCopyWith<$Res> get subject;
}

/// @nodoc
class __$SubjectInfoCopyWithImpl<$Res> extends _$SubjectInfoCopyWithImpl<$Res>
    implements _$SubjectInfoCopyWith<$Res> {
  __$SubjectInfoCopyWithImpl(
      _SubjectInfo _value, $Res Function(_SubjectInfo) _then)
      : super(_value, (v) => _then(v as _SubjectInfo));

  @override
  _SubjectInfo get _value => super._value as _SubjectInfo;

  @override
  $Res call({
    Object? subject = freezed,
    Object? currentWeek = freezed,
  }) {
    return _then(_SubjectInfo(
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      currentWeek: currentWeek == freezed
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
            other is _SubjectInfo &&
            const DeepCollectionEquality().equals(other.subject, subject) &&
            const DeepCollectionEquality()
                .equals(other.currentWeek, currentWeek));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(subject),
      const DeepCollectionEquality().hash(currentWeek));

  @JsonKey(ignore: true)
  @override
  _$SubjectInfoCopyWith<_SubjectInfo> get copyWith =>
      __$SubjectInfoCopyWithImpl<_SubjectInfo>(this, _$identity);
}

abstract class _SubjectInfo implements SubjectInfo {
  const factory _SubjectInfo(
      {required Subject subject, required int currentWeek}) = _$_SubjectInfo;

  @override
  Subject get subject;
  @override
  int get currentWeek;
  @override
  @JsonKey(ignore: true)
  _$SubjectInfoCopyWith<_SubjectInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
