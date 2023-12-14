import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class TagModel {
  String cover;
  String content;
  int id;
  int? postCount;
  String createTime;
  TagModel(this.cover, this.postCount, this.content, this.createTime, this.id);

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}
