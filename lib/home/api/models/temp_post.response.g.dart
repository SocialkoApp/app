// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_post.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempPostResponse _$TempPostResponseFromJson(Map<String, dynamic> json) =>
    TempPostResponse(
      id: json['id'] as String,
      votes: (json['votes'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] == null
          ? null
          : ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      author: ProfileResponse.fromJson(json['author'] as Map<String, dynamic>),
      score: json['score'] as num,
      type: json['type'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$TempPostResponseToJson(TempPostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'votes': instance.votes,
      'comments': instance.comments,
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
      'image': instance.image,
      'score': instance.score,
      'type': instance.type,
      'createdAt': instance.createdAt,
    };
