import 'package:json_annotation/json_annotation.dart';

part 'profile_picture_update.dto.g.dart';

@JsonSerializable()
class ProfilePictureDto {
  ProfilePictureDto({
    required this.fileId,
  });

  final String fileId;

  factory ProfilePictureDto.fromJson(Map<String, dynamic> json) =>
      _$ProfilePictureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePictureDtoToJson(this);
}
