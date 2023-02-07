import 'package:app/home/api/models/image.response.dart';
import 'package:app/profile/api/models/profile.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temp_post.response.g.dart';

@JsonSerializable()
class TempPostResponse {
  TempPostResponse({
    required this.id,
    required this.votes,
    required this.comments,
    required this.title,
    required this.description,
    required this.image,
    required this.author,
    required this.score,
    required this.type,
    required this.createdAt,
  });

  final String id;

  final List<Map<String, dynamic>> votes;
  final List<Map<String, dynamic>> comments;

  final String? title;
  final String? description;

  final ProfileResponse author;

  final ImageResponse? image;

  final num score;
  final String type;

  final String createdAt;

  factory TempPostResponse.fromJson(Map<String, dynamic> json) =>
      _$TempPostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TempPostResponseToJson(this);
}
