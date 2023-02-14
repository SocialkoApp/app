// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_picture.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePicture _$ProfilePictureFromJson(Map<String, dynamic> json) =>
    ProfilePicture(
      url: json['url'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ProfilePictureToJson(ProfilePicture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
