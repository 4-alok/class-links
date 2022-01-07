import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ThemeModeAdapter extends TypeAdapter<ThemeMode> {
  @override
  ThemeMode read(BinaryReader reader) {
    final int index = reader.readInt();
    return ThemeMode.values[index];
  }

  @override
  void write(BinaryWriter writer, ThemeMode obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 150;
}

class ColorAdapter extends TypeAdapter<Color> {
  @override
  Color read(BinaryReader reader) {
    final int value = reader.readInt();
    return Color(value);
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeInt(obj.value);
  }

  @override
  int get typeId => 151;
}

class FlexSchemeAdapter extends TypeAdapter<FlexScheme> {
  @override
  FlexScheme read(BinaryReader reader) {
    final int index = reader.readInt();
    return FlexScheme.values[index];
  }

  @override
  void write(BinaryWriter writer, FlexScheme obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 152;
}

class FlexAppBarStyleAdapter extends TypeAdapter<FlexAppBarStyle> {
  @override
  FlexAppBarStyle read(BinaryReader reader) {
    final int index = reader.readInt();
    return FlexAppBarStyle.values[index];
  }

  @override
  void write(BinaryWriter writer, FlexAppBarStyle obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 155;
}