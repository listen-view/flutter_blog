// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      json['title'] as String,
      json['id'] as int,
      json['content'] as String,
      json['cover'] as String,
      json['author'] as String,
      json['createTime'] as String,
      (json['tag'] as List<dynamic>)
          .map((e) => TagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'cover': instance.cover,
      'author': instance.author,
      'createTime': instance.createTime,
      'id': instance.id,
      'tag': instance.tag,
    };
