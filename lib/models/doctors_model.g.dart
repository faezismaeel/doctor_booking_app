// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorsModelAdapter extends TypeAdapter<DoctorsModel> {
  @override
  final int typeId = 1;

  @override
  DoctorsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorsModel(
      id: fields[0] as int?,
      drname: fields[1] as String?,
      subtitle: fields[2] as String?,
      image: fields[3] as String?,
      about: fields[4] as String?,
      rating: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DoctorsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.drname)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.about)
      ..writeByte(5)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
