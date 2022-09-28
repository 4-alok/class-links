// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$SheetDataCopyWithImpl<$Res>;
  $Res call({List<List<String>> rowList});
}

/// @nodoc
class _$SheetDataCopyWithImpl<$Res> implements $SheetDataCopyWith<$Res> {
  _$SheetDataCopyWithImpl(this._value, this._then);

  final SheetData _value;
  // ignore: unused_field
  final $Res Function(SheetData) _then;

  @override
  $Res call({
    Object? rowList = freezed,
  }) {
    return _then(_value.copyWith(
      rowList: rowList == freezed
          ? _value.rowList
          : rowList // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

/// @nodoc
abstract class _$$_SheetDataCopyWith<$Res> implements $SheetDataCopyWith<$Res> {
  factory _$$_SheetDataCopyWith(
          _$_SheetData value, $Res Function(_$_SheetData) then) =
      __$$_SheetDataCopyWithImpl<$Res>;
  @override
  $Res call({List<List<String>> rowList});
}

/// @nodoc
class __$$_SheetDataCopyWithImpl<$Res> extends _$SheetDataCopyWithImpl<$Res>
    implements _$$_SheetDataCopyWith<$Res> {
  __$$_SheetDataCopyWithImpl(
      _$_SheetData _value, $Res Function(_$_SheetData) _then)
      : super(_value, (v) => _then(v as _$_SheetData));

  @override
  _$_SheetData get _value => super._value as _$_SheetData;

  @override
  $Res call({
    Object? rowList = freezed,
  }) {
    return _then(_$_SheetData(
      rowList: rowList == freezed
          ? _value._rowList
          : rowList // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SheetData implements _SheetData {
  const _$_SheetData({required final List<List<String>> rowList})
      : _rowList = rowList;

  factory _$_SheetData.fromJson(Map<String, dynamic> json) =>
      _$$_SheetDataFromJson(json);

  final List<List<String>> _rowList;
  @override
  List<List<String>> get rowList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rowList);
  }

  @override
  String toString() {
    return 'SheetData(rowList: $rowList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SheetData &&
            const DeepCollectionEquality().equals(other._rowList, _rowList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rowList));

  @JsonKey(ignore: true)
  @override
  _$$_SheetDataCopyWith<_$_SheetData> get copyWith =>
      __$$_SheetDataCopyWithImpl<_$_SheetData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SheetDataToJson(
      this,
    );
  }
}

abstract class _SheetData implements SheetData {
  const factory _SheetData({required final List<List<String>> rowList}) =
      _$_SheetData;

  factory _SheetData.fromJson(Map<String, dynamic> json) =
      _$_SheetData.fromJson;

  @override
  List<List<String>> get rowList;
  @override
  @JsonKey(ignore: true)
  _$$_SheetDataCopyWith<_$_SheetData> get copyWith =>
      throw _privateConstructorUsedError;
}
