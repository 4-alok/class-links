// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BatchYear _$$_BatchYearFromJson(Map<String, dynamic> json) => _$_BatchYear(
      forBatchYear: json['forBatchYear'] as int,
      branches: (json['branches'] as List<dynamic>)
          .map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BatchYearToJson(_$_BatchYear instance) =>
    <String, dynamic>{
      'forBatchYear': instance.forBatchYear,
      'branches': instance.branches.map((e) => e.toJson()).toList(),
    };

_$_Branch _$$_BranchFromJson(Map<String, dynamic> json) => _$_Branch(
      branchName: json['branchName'] as String,
      slots: (json['slots'] as List<dynamic>)
          .map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BranchToJson(_$_Branch instance) => <String, dynamic>{
      'branchName': instance.branchName,
      'slots': instance.slots.map((e) => e.toJson()).toList(),
    };

_$_Slot _$$_SlotFromJson(Map<String, dynamic> json) => _$_Slot(
      slotNo: json['slotNo'] as int,
      batches: (json['batches'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SlotToJson(_$_Slot instance) => <String, dynamic>{
      'slotNo': instance.slotNo,
      'batches': instance.batches,
    };
