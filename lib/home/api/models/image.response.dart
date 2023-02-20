import 'package:json_annotation/json_annotation.dart';

part 'image.response.g.dart';

@JsonSerializable()
class ImageResponse {
  ImageResponse({
    required this.url,
    this.id,
  });

  final String? id;
  final String url;

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}
