import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

DateTime _dateTimeFromJson(String value) => DateTime.parse(value);

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
  @JsonKey(fromJson: _dateTimeFromJson)
  @HiveField(10)
  final DateTime? createdAt;
  @HiveField(11)
  final int? readTime;

  ItemPost({
    required this.id,
    required this.title,
    required this.description,
    required this.sourceLink,
    required this.sourceTitle,
    required this.view,
    required this.like,
    required this.image,
    required this.createdAt,
    required this.categoryId,
    required this.categoryName,
    required this.readTime,
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
