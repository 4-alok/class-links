import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch.freezed.dart';
part 'batch.g.dart';

@freezed
class BatchYear with _$BatchYear {
  const factory BatchYear({
    required int forBatchYear,
    required List<Branch> branches,
  }) = _BatchYear;

  factory BatchYear.fromJson(Map<String, dynamic> json) =>
      _$BatchYearFromJson(json);
}

@freezed
class Branch with _$Branch {
  const factory Branch({
    required String branchName,
    required List<Slot> slots,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) =>
      _$BranchFromJson(json);
}

@freezed
class Slot with _$Slot {
  const factory Slot({
    required int slotNo,
    @Default([]) List<String> batches,
  }) = _Slot;

  factory Slot.fromJson(Map<String, dynamic> json) =>
      _$SlotFromJson(json);
}