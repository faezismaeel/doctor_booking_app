// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appoinments_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppoinmentsAdapter extends TypeAdapter<Appoinments> {
  @override
  final int typeId = 2;

  @override
  Appoinments read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Appoinments(
      date: fields[2] as DateTime?,
      time: fields[3] as String?,
      drId: fields[1] as int?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Appoinments obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.drId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppoinmentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
