import 'package:app/home/api/models/image.response.dart';
import 'package:app/profile/api/models/profile.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temp_post.response.g.dart';

@JsonSerializable()
class TempPostResponse {
  TempPostResponse({
    required this.id,
    required this.upvotes,
    required this.downvotes,
    required this.title,
    required this.description,
    required this.image,
    required this.author,
    required this.score,
    required this.type,
    required this.createdAt,
  });

  final String id;

  final List<Map<String, dynamic>> upvotes;
  final List<Map<String, dynamic>> downvotes;

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
