// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagModel _$TagModelFromJson(Map<String, dynamic> json) => TagModel(
      json['cover'] as String,
      json['content'] as String,
      json['createTime'] as String,
      json['id'] as int,
    );

Map<String, dynamic> _$TagModelToJson(TagModel instance) => <String, dynamic>{
      'cover': instance.cover,
      'content': instance.content,
      'id': instance.id,
      'createTime': instance.createTime,
    };
