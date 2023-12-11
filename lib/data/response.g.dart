// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemPostAdapter extends TypeAdapter<ItemPost> {
  @override
  final int typeId = 1;

  @override
  ItemPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemPost(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      sourceLink: fields[5] as String,
      sourceTitle: fields[4] as String,
      view: fields[8] as int,
      like: fields[9] as int,
      image: fields[3] as String,
      createdAt: fields[10] as DateTime?,
      categoryId: fields[6] as String,
      categoryName: fields[7] as String,
      readTime: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemPost obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.sourceTitle)
      ..writeByte(5)
      ..write(obj.sourceLink)
      ..writeByte(6)
      ..write(obj.categoryId)
      ..writeByte(7)
      ..write(obj.categoryName)
      ..writeByte(8)
      ..write(obj.view)
      ..writeByte(9)
      ..write(obj.like)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.readTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemPostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posts _$PostsFromJson(Map<String, dynamic> json) => Posts(
      news: (json['news'] as List<dynamic>)
          .map((e) => ItemPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: json['totalItem'] as int?,
    );

ItemPost _$ItemPostFromJson(Map<String, dynamic> json) => ItemPost(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      sourceLink: json['source_link'] as String,
      sourceTitle: json['source_title'] as String,
      view: json['view'] as int,
      like: json['like'] as int,
      image: json['image'] as String,
      createdAt: _dateTimeFromJson(json['created_at'] as String),
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      readTime: json['read_time'] as int?,
    );

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: json['_id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );
