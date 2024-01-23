// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appoinments_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppoinmentsAdapter extends TypeAdapter<Appoinments> {
  @override
  final int typeId = 1;

  @override
  Appoinments read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Appoinments(
      date: fields[2] as DateTime?,
      time: fields[3] as String?,
      drname: fields[1] as String?,
      image: fields[4] as String?,
      id: fields[0] as int?,
    )..rating = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, Appoinments obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.drname)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.rating);
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
