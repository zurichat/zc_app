// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PluginModelAdapter extends TypeAdapter<PluginModel> {
  @override
  final int typeId = 0;

  @override
  PluginModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PluginModel(
      icon: fields[0] as String,
      name: fields[1] as String,
      url: fields[2] as String,
      isCheck: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PluginModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.icon)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.isCheck);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PluginModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
