import 'package:class_link/services/firebase/models/user_elective_section.dart';
import 'package:hive_flutter/adapters.dart';

class UserElectiveSectionAdapter extends TypeAdapter<UserElectiveSection> {
  @override
  UserElectiveSection read(BinaryReader reader) {
    return UserElectiveSection(
      rollNo: reader.readInt(),
      elective1Section: reader.readString(),
      elective2Section: reader.readString(),
    );
  }

  @override
  int get typeId => 31;

  @override
  void write(BinaryWriter writer, obj) {
    writer.writeInt(obj.rollNo);
    writer.writeString(obj.elective1Section);
    writer.writeString(obj.elective2Section);
  }
}
