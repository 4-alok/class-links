import 'package:hive_flutter/adapters.dart';

import 'sheet_data.dart';

class SheetDataAdapter extends TypeAdapter<SheetData> {
  @override
  final int typeId = 13;

  @override
  SheetData read(BinaryReader reader) {
    return SheetData(
      rowList: reader.readList().cast<List<String>>(),
    );
  }

  @override
  void write(BinaryWriter writer, SheetData obj) {
    writer.writeList(obj.rowList);
  }
}
