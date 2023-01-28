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
      cult: json['cult'] == null
          ? null
          : ProfileCult.fromJson(json['cult'] as Map<String, dynamic>),
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
      'cult': instance.cult,
      'updatedAt': instance.updatedAt,
    };
