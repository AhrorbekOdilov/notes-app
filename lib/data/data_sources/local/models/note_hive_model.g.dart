// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteHiveModelAdapter extends TypeAdapter<NoteHiveModel> {
  @override
  final int typeId = 0;

  @override
  NoteHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteHiveModel(
      text: fields[0] as String?,
      dateTime: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NoteHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
