import 'package:app/profile/api/models/cult.response.dart';
import 'package:app/profile/api/models/cult_join_request.response.dart';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/profile/api/models/user.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.response.g.dart';

@JsonSerializable()
class ProfileResponse {
  ProfileResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.user,
    required this.profilePicture,
    required this.cult,
    required this.cultJoinRequest,
    required this.updatedAt,
  });

  final String id;

  final String firstName;
  final String lastName;

  final String? bio;

  final ProfileUser user;
  final ProfilePicture? profilePicture;

  final ProfileCult? cult;
  final CultJoinRequest? cultJoinRequest;

  final String? updatedAt;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
