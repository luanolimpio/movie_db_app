// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCacheModelAdapter extends TypeAdapter<HiveCacheModel> {
  @override
  final int typeId = 0;

  @override
  HiveCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCacheModel(
      id: fields[0] as String,
      data: (fields[2] as Map).cast<String, dynamic>(),
      date: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCacheModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
