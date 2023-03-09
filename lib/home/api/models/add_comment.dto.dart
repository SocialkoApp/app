import 'package:json_annotation/json_annotation.dart';

part 'add_comment.dto.g.dart';

@JsonSerializable()
class AddCommentDto {
  AddCommentDto({
    required this.postId,
    required this.content,
  });

  final String postId;
  final String content;

  factory AddCommentDto.fromJson(Map<String, dynamic> json) =>
      _$AddCommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddCommentDtoToJson(this);
}
