import 'package:hive_flutter/adapters.dart';

import 'my_teacher_model.dart';

class TeacherAdapter extends TypeAdapter<Teacher> {
  @override
  Teacher read(BinaryReader reader) {
    return Teacher(
      teacherName: reader.readString(),
      subjectName: reader.readString(),
    );
  }

  @override
  int get typeId => 21;

  @override
  void write(BinaryWriter writer, obj) {
    writer.writeString(obj.teacherName);
    writer.writeString(obj.subjectName);
  }
}

class MyTeacherAdapter extends TypeAdapter<MyTeachers> {
  @override
  MyTeachers read(BinaryReader reader) {
    return MyTeachers(
      batch: reader.readString(),
      teachers: reader.readList().cast<Teacher>(),
    );
  }

  @override
  int get typeId => 22;

  @override
  void write(BinaryWriter writer, obj) {
    writer.writeString(obj.batch);
    writer.writeList(obj.teachers);
  }
}
