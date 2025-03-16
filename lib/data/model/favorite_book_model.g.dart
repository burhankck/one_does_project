// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteBookModelAdapter extends TypeAdapter<FavoriteBookModel> {
  @override
  final int typeId = 1;

  @override
  FavoriteBookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteBookModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      handle: fields[2] as String?,
      publisher: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteBookModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.handle)
      ..writeByte(3)
      ..write(obj.publisher);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteBookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
