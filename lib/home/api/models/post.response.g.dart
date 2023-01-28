// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      id: json['id'] as String,
      upvotes: (json['upvotes'] as List<dynamic>)
          .map((e) => ProfileResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      downvotes: (json['downvotes'] as List<dynamic>)
          .map((e) => ProfileResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      image: json['image'] == null
          ? null
          : ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      author: ProfileResponse.fromJson(json['author'] as Map<String, dynamic>),
      score: json['score'] as num,
      type: json['type'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
      'description': instance.description,
      'author': instance.author,
      'image': instance.image,
      'score': instance.score,
      'type': instance.type,
      'createdAt': instance.createdAt,
    };
