// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      bio: json['bio'] as String?,
      user: ProfileUser.fromJson(json['user'] as Map<String, dynamic>),
      profilePicture: json['profilePicture'] == null
          ? null
          : ProfilePicture.fromJson(
              json['profilePicture'] as Map<String, dynamic>),
      organization: json['organization'] == null
          ? null
          : ProfileOrg.fromJson(json['organization'] as Map<String, dynamic>),
      organizationJoinRequest: json['organizationJoinRequest'] == null
          ? null
          : OrgJoinRequest.fromJson(
              json['organizationJoinRequest'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'bio': instance.bio,
      'user': instance.user,
      'profilePicture': instance.profilePicture,
      'organization': instance.organization,
      'organizationJoinRequest': instance.organizationJoinRequest,
      'updatedAt': instance.updatedAt,
    };
