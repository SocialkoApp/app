import 'package:app/profile/api/models/org.response.dart';
import 'package:app/profile/api/models/org_join_request.response.dart';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/profile/api/models/user.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String id;

  final String firstName;
  final String lastName;

  final String? bio;

  final ProfileUser user;
  final ProfilePicture? profilePicture;

  final ProfileOrg? organization;
  final OrgJoinRequest? organizationJoinRequest;

  final String? updatedAt;

  ProfileResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.user,
    required this.profilePicture,
    required this.organization,
    required this.organizationJoinRequest,
    required this.updatedAt,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
