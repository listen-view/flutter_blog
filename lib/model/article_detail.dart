import 'package:json_annotation/json_annotation.dart';

part 'article_detail.g.dart';

@JsonSerializable()
class ArticleModel {
  String title;
  String content;
  String cover;
  String author;
  ArticleModel(this.title, this.content, this.cover, this.author);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
