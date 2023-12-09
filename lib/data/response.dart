import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Posts {
  final List<ItemPost> news;
  @JsonKey(name: 'totalItem')
  final int? totalItems;

  Posts({
    required this.news,
    required this.totalItems,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 1)
class ItemPost{
  @JsonKey(name: '_id')
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String sourceTitle;
  @HiveField(5)
  final String sourceLink;
  @HiveField(6)
  final String categoryId;
  @HiveField(7)
  final String categoryName;
  @HiveField(8)
  final int view;
  @HiveField(9)
  final int like;
  @HiveField(10)
  final DateTime? createAt;

  ItemPost({
    required this.id,
    required this.title,
    required this.description,
    required this.sourceLink,
    required this.sourceTitle,
    required this.view,
    required this.like,
    required this.image,
    required this.createAt,
    required this.categoryId,
    required this.categoryName,
  });

  factory ItemPost.fromJson(Map<String, dynamic> json) => _$ItemPostFromJson(json);
}

@JsonSerializable()
class Categories {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  Categories({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
}
