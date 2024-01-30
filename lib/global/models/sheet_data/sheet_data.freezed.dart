// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sheet_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SheetData _$SheetDataFromJson(Map<String, dynamic> json) {
  return _SheetData.fromJson(json);
}

/// @nodoc
mixin _$SheetData {
  List<List<String>> get rowList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SheetDataCopyWith<SheetData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SheetDataCopyWith<$Res> {
  factory $SheetDataCopyWith(SheetData value, $Res Function(SheetData) then) =
      _$SheetDataCopyWithImpl<$Res, SheetData>;
  @useResult
  $Res call({List<List<String>> rowList});
}

/// @nodoc
class _$SheetDataCopyWithImpl<$Res, $Val extends SheetData>
    implements $SheetDataCopyWith<$Res> {
  _$SheetDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowList = null,
  }) {
    return _then(_value.copyWith(
      rowList: null == rowList
          ? _value.rowList
          : rowList // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SheetDataImplCopyWith<$Res>
    implements $SheetDataCopyWith<$Res> {
  factory _$$SheetDataImplCopyWith(
          _$SheetDataImpl value, $Res Function(_$SheetDataImpl) then) =
      __$$SheetDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<String>> rowList});
}

/// @nodoc
class __$$SheetDataImplCopyWithImpl<$Res>
    extends _$SheetDataCopyWithImpl<$Res, _$SheetDataImpl>
    implements _$$SheetDataImplCopyWith<$Res> {
  __$$SheetDataImplCopyWithImpl(
      _$SheetDataImpl _value, $Res Function(_$SheetDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowList = null,
  }) {
    return _then(_$SheetDataImpl(
      rowList: null == rowList
          ? _value._rowList
          : rowList // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SheetDataImpl implements _SheetData {
  const _$SheetDataImpl({required final List<List<String>> rowList})
      : _rowList = rowList;

  factory _$SheetDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SheetDataImplFromJson(json);

  final List<List<String>> _rowList;
  @override
  List<List<String>> get rowList {
    if (_rowList is EqualUnmodifiableListView) return _rowList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rowList);
  }

  @override
  String toString() {
    return 'SheetData(rowList: $rowList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SheetDataImpl &&
            const DeepCollectionEquality().equals(other._rowList, _rowList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rowList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SheetDataImplCopyWith<_$SheetDataImpl> get copyWith =>
      __$$SheetDataImplCopyWithImpl<_$SheetDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SheetDataImplToJson(
      this,
    );
  }
}

abstract class _SheetData implements SheetData {
  const factory _SheetData({required final List<List<String>> rowList}) =
      _$SheetDataImpl;

  factory _SheetData.fromJson(Map<String, dynamic> json) =
      _$SheetDataImpl.fromJson;

  @override
  List<List<String>> get rowList;
  @override
  @JsonKey(ignore: true)
  _$$SheetDataImplCopyWith<_$SheetDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
