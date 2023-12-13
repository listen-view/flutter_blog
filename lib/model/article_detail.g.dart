// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      json['title'] as String,
      json['content'] as String,
      json['cover'] as String,
      json['author'] as String,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'cover': instance.cover,
      'author': instance.author,
    };
