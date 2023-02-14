import 'package:json_annotation/json_annotation.dart';

part 'profile_picture.response.g.dart';

@JsonSerializable()
class ProfilePicture {
  ProfilePicture({
    required this.url,
    this.id,
  });

  final String? id;
  final String url;

  factory ProfilePicture.fromJson(Map<String, dynamic> json) =>
      _$ProfilePictureFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePictureToJson(this);
}
