import 'package:json_annotation/json_annotation.dart';
import 'package:material_app/model/tag.dart';

part 'article_detail.g.dart';

@JsonSerializable()
class ArticleModel {
  String title;
  String content;
  String cover;
  String author;
  String createTime;
  int id;
  List<TagModel> tag;
  ArticleModel(this.title, this.id, this.content, this.cover, this.author,
      this.createTime, this.tag);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
