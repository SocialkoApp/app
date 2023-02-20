import 'package:json_annotation/json_annotation.dart';

part 'create_post.dto.g.dart';

@JsonSerializable()
class CreatePostDto {
  CreatePostDto({
    required this.type,
    this.title,
    this.description,
    this.imageId,
  });

  final String type;

  final String? title;
  final String? description;

  final String? imageId;

  factory CreatePostDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostDtoToJson(this);
}
