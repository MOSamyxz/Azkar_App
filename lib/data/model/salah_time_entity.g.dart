// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salah_time_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalahTimeEntityAdapter extends TypeAdapter<SalahTimeEntity> {
  @override
  final int typeId = 0;

  @override
  SalahTimeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalahTimeEntity(
      gYear: fields[0] as String,
      gMonthe: fields[1] as String,
      gDay: fields[2] as String,
      gDate: fields[3] as String,
      hYear: fields[4] as String,
      hMonthe: fields[5] as String,
      hDay: fields[6] as String,
      isha: fields[7] as String,
      maghrib: fields[8] as String,
      asr: fields[9] as String,
      dhuhr: fields[10] as String,
      sunrise: fields[11] as String,
      fajr: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SalahTimeEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.gYear)
      ..writeByte(1)
      ..write(obj.gMonthe)
      ..writeByte(2)
      ..write(obj.gDay)
      ..writeByte(3)
      ..write(obj.gDate)
      ..writeByte(4)
      ..write(obj.hYear)
      ..writeByte(5)
      ..write(obj.hMonthe)
      ..writeByte(6)
      ..write(obj.hDay)
      ..writeByte(7)
      ..write(obj.isha)
      ..writeByte(8)
      ..write(obj.maghrib)
      ..writeByte(9)
      ..write(obj.asr)
      ..writeByte(10)
      ..write(obj.dhuhr)
      ..writeByte(11)
      ..write(obj.sunrise)
      ..writeByte(12)
      ..write(obj.fajr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalahTimeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
