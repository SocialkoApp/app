// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cult.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileCult _$ProfileCultFromJson(Map<String, dynamic> json) => ProfileCult(
      cult: json['cult'] == null
          ? null
          : ProfileCultData.fromJson(json['cult'] as Map<String, dynamic>),
      role: json['role'] as String,
    );

Map<String, dynamic> _$ProfileCultToJson(ProfileCult instance) =>
    <String, dynamic>{
      'cult': instance.cult,
      'role': instance.role,
    };
