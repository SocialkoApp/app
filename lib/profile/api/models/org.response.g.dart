// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileOrg _$ProfileOrgFromJson(Map<String, dynamic> json) => ProfileOrg(
      organization: json['organization'] == null
          ? null
          : OrganizationResponse.fromJson(
              json['organization'] as Map<String, dynamic>),
      role: json['role'] as String,
    );

Map<String, dynamic> _$ProfileOrgToJson(ProfileOrg instance) =>
    <String, dynamic>{
      'organization': instance.organization,
      'role': instance.role,
    };
