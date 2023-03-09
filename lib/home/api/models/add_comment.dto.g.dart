// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentDto _$AddCommentDtoFromJson(Map<String, dynamic> json) =>
    AddCommentDto(
      postId: json['postId'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$AddCommentDtoToJson(AddCommentDto instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'content': instance.content,
    };
