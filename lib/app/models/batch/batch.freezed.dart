// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BatchYear _$BatchYearFromJson(Map<String, dynamic> json) {
  return _BatchYear.fromJson(json);
}

/// @nodoc
class _$BatchYearTearOff {
  const _$BatchYearTearOff();

  _BatchYear call({required int forBatchYear, required List<Branch> branches}) {
    return _BatchYear(
      forBatchYear: forBatchYear,
      branches: branches,
    );
  }

  BatchYear fromJson(Map<String, Object?> json) {
    return BatchYear.fromJson(json);
  }
}

/// @nodoc
const $BatchYear = _$BatchYearTearOff();

/// @nodoc
mixin _$BatchYear {
  int get forBatchYear => throw _privateConstructorUsedError;
  List<Branch> get branches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchYearCopyWith<BatchYear> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchYearCopyWith<$Res> {
  factory $BatchYearCopyWith(BatchYear value, $Res Function(BatchYear) then) =
      _$BatchYearCopyWithImpl<$Res>;
  $Res call({int forBatchYear, List<Branch> branches});
}

/// @nodoc
class _$BatchYearCopyWithImpl<$Res> implements $BatchYearCopyWith<$Res> {
  _$BatchYearCopyWithImpl(this._value, this._then);

  final BatchYear _value;
  // ignore: unused_field
  final $Res Function(BatchYear) _then;

  @override
  $Res call({
    Object? forBatchYear = freezed,
    Object? branches = freezed,
  }) {
    return _then(_value.copyWith(
      forBatchYear: forBatchYear == freezed
          ? _value.forBatchYear
          : forBatchYear // ignore: cast_nullable_to_non_nullable
              as int,
      branches: branches == freezed
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>,
    ));
  }
}

/// @nodoc
abstract class _$BatchYearCopyWith<$Res> implements $BatchYearCopyWith<$Res> {
  factory _$BatchYearCopyWith(
          _BatchYear value, $Res Function(_BatchYear) then) =
      __$BatchYearCopyWithImpl<$Res>;
  @override
  $Res call({int forBatchYear, List<Branch> branches});
}

/// @nodoc
class __$BatchYearCopyWithImpl<$Res> extends _$BatchYearCopyWithImpl<$Res>
    implements _$BatchYearCopyWith<$Res> {
  __$BatchYearCopyWithImpl(_BatchYear _value, $Res Function(_BatchYear) _then)
      : super(_value, (v) => _then(v as _BatchYear));

  @override
  _BatchYear get _value => super._value as _BatchYear;

  @override
  $Res call({
    Object? forBatchYear = freezed,
    Object? branches = freezed,
  }) {
    return _then(_BatchYear(
      forBatchYear: forBatchYear == freezed
          ? _value.forBatchYear
          : forBatchYear // ignore: cast_nullable_to_non_nullable
              as int,
      branches: branches == freezed
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BatchYear implements _BatchYear {
  const _$_BatchYear({required this.forBatchYear, required this.branches});

  factory _$_BatchYear.fromJson(Map<String, dynamic> json) =>
      _$$_BatchYearFromJson(json);

  @override
  final int forBatchYear;
  @override
  final List<Branch> branches;

  @override
  String toString() {
    return 'BatchYear(forBatchYear: $forBatchYear, branches: $branches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BatchYear &&
            (identical(other.forBatchYear, forBatchYear) ||
                other.forBatchYear == forBatchYear) &&
            const DeepCollectionEquality().equals(other.branches, branches));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, forBatchYear, const DeepCollectionEquality().hash(branches));

  @JsonKey(ignore: true)
  @override
  _$BatchYearCopyWith<_BatchYear> get copyWith =>
      __$BatchYearCopyWithImpl<_BatchYear>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatchYearToJson(this);
  }
}

abstract class _BatchYear implements BatchYear {
  const factory _BatchYear(
      {required int forBatchYear,
      required List<Branch> branches}) = _$_BatchYear;

  factory _BatchYear.fromJson(Map<String, dynamic> json) =
      _$_BatchYear.fromJson;

  @override
  int get forBatchYear;
  @override
  List<Branch> get branches;
  @override
  @JsonKey(ignore: true)
  _$BatchYearCopyWith<_BatchYear> get copyWith =>
      throw _privateConstructorUsedError;
}

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
class _$BranchTearOff {
  const _$BranchTearOff();

  _Branch call({required String branchName, required List<Slot> slots}) {
    return _Branch(
      branchName: branchName,
      slots: slots,
    );
  }

  Branch fromJson(Map<String, Object?> json) {
    return Branch.fromJson(json);
  }
}

/// @nodoc
const $Branch = _$BranchTearOff();

/// @nodoc
mixin _$Branch {
  String get branchName => throw _privateConstructorUsedError;
  List<Slot> get slots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res>;
  $Res call({String branchName, List<Slot> slots});
}

/// @nodoc
class _$BranchCopyWithImpl<$Res> implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  final Branch _value;
  // ignore: unused_field
  final $Res Function(Branch) _then;

  @override
  $Res call({
    Object? branchName = freezed,
    Object? slots = freezed,
  }) {
    return _then(_value.copyWith(
      branchName: branchName == freezed
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      slots: slots == freezed
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<Slot>,
    ));
  }
}

/// @nodoc
abstract class _$BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$BranchCopyWith(_Branch value, $Res Function(_Branch) then) =
      __$BranchCopyWithImpl<$Res>;
  @override
  $Res call({String branchName, List<Slot> slots});
}

/// @nodoc
class __$BranchCopyWithImpl<$Res> extends _$BranchCopyWithImpl<$Res>
    implements _$BranchCopyWith<$Res> {
  __$BranchCopyWithImpl(_Branch _value, $Res Function(_Branch) _then)
      : super(_value, (v) => _then(v as _Branch));

  @override
  _Branch get _value => super._value as _Branch;

  @override
  $Res call({
    Object? branchName = freezed,
    Object? slots = freezed,
  }) {
    return _then(_Branch(
      branchName: branchName == freezed
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      slots: slots == freezed
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<Slot>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Branch implements _Branch {
  const _$_Branch({required this.branchName, required this.slots});

  factory _$_Branch.fromJson(Map<String, dynamic> json) =>
      _$$_BranchFromJson(json);

  @override
  final String branchName;
  @override
  final List<Slot> slots;

  @override
  String toString() {
    return 'Branch(branchName: $branchName, slots: $slots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Branch &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            const DeepCollectionEquality().equals(other.slots, slots));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, branchName, const DeepCollectionEquality().hash(slots));

  @JsonKey(ignore: true)
  @override
  _$BranchCopyWith<_Branch> get copyWith =>
      __$BranchCopyWithImpl<_Branch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchToJson(this);
  }
}

abstract class _Branch implements Branch {
  const factory _Branch(
      {required String branchName, required List<Slot> slots}) = _$_Branch;

  factory _Branch.fromJson(Map<String, dynamic> json) = _$_Branch.fromJson;

  @override
  String get branchName;
  @override
  List<Slot> get slots;
  @override
  @JsonKey(ignore: true)
  _$BranchCopyWith<_Branch> get copyWith => throw _privateConstructorUsedError;
}

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return _Slot.fromJson(json);
}

/// @nodoc
class _$SlotTearOff {
  const _$SlotTearOff();

  _Slot call({required int slotNo, List<String> batches = const []}) {
    return _Slot(
      slotNo: slotNo,
      batches: batches,
    );
  }

  Slot fromJson(Map<String, Object?> json) {
    return Slot.fromJson(json);
  }
}

/// @nodoc
const $Slot = _$SlotTearOff();

/// @nodoc
mixin _$Slot {
  int get slotNo => throw _privateConstructorUsedError;
  List<String> get batches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlotCopyWith<Slot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotCopyWith<$Res> {
  factory $SlotCopyWith(Slot value, $Res Function(Slot) then) =
      _$SlotCopyWithImpl<$Res>;
  $Res call({int slotNo, List<String> batches});
}

/// @nodoc
class _$SlotCopyWithImpl<$Res> implements $SlotCopyWith<$Res> {
  _$SlotCopyWithImpl(this._value, this._then);

  final Slot _value;
  // ignore: unused_field
  final $Res Function(Slot) _then;

  @override
  $Res call({
    Object? slotNo = freezed,
    Object? batches = freezed,
  }) {
    return _then(_value.copyWith(
      slotNo: slotNo == freezed
          ? _value.slotNo
          : slotNo // ignore: cast_nullable_to_non_nullable
              as int,
      batches: batches == freezed
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$SlotCopyWith<$Res> implements $SlotCopyWith<$Res> {
  factory _$SlotCopyWith(_Slot value, $Res Function(_Slot) then) =
      __$SlotCopyWithImpl<$Res>;
  @override
  $Res call({int slotNo, List<String> batches});
}

/// @nodoc
class __$SlotCopyWithImpl<$Res> extends _$SlotCopyWithImpl<$Res>
    implements _$SlotCopyWith<$Res> {
  __$SlotCopyWithImpl(_Slot _value, $Res Function(_Slot) _then)
      : super(_value, (v) => _then(v as _Slot));

  @override
  _Slot get _value => super._value as _Slot;

  @override
  $Res call({
    Object? slotNo = freezed,
    Object? batches = freezed,
  }) {
    return _then(_Slot(
      slotNo: slotNo == freezed
          ? _value.slotNo
          : slotNo // ignore: cast_nullable_to_non_nullable
              as int,
      batches: batches == freezed
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Slot implements _Slot {
  const _$_Slot({required this.slotNo, this.batches = const []});

  factory _$_Slot.fromJson(Map<String, dynamic> json) => _$$_SlotFromJson(json);

  @override
  final int slotNo;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> batches;

  @override
  String toString() {
    return 'Slot(slotNo: $slotNo, batches: $batches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Slot &&
            (identical(other.slotNo, slotNo) || other.slotNo == slotNo) &&
            const DeepCollectionEquality().equals(other.batches, batches));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, slotNo, const DeepCollectionEquality().hash(batches));

  @JsonKey(ignore: true)
  @override
  _$SlotCopyWith<_Slot> get copyWith =>
      __$SlotCopyWithImpl<_Slot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlotToJson(this);
  }
}

abstract class _Slot implements Slot {
  const factory _Slot({required int slotNo, List<String> batches}) = _$_Slot;

  factory _Slot.fromJson(Map<String, dynamic> json) = _$_Slot.fromJson;

  @override
  int get slotNo;
  @override
  List<String> get batches;
  @override
  @JsonKey(ignore: true)
  _$SlotCopyWith<_Slot> get copyWith => throw _privateConstructorUsedError;
}
