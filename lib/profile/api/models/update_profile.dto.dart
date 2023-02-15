import 'package:json_annotation/json_annotation.dart';

part 'update_profile.dto.g.dart';

@JsonSerializable()
class UpdateProfileDto {
  UpdateProfileDto({
    this.firstName,
    this.lastName,
    this.bio,
  });

  final String? firstName;
  final String? lastName;

  final String? bio;

  factory UpdateProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileDtoToJson(this);
}
