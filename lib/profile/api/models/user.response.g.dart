// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) => ProfileUser(
      username: json['username'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ProfileUserToJson(ProfileUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
    };
