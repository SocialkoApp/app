// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_join_request.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgJoinRequest _$OrgJoinRequestFromJson(Map<String, dynamic> json) =>
    OrgJoinRequest(
      organization: OrganizationResponse.fromJson(
          json['organization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrgJoinRequestToJson(OrgJoinRequest instance) =>
    <String, dynamic>{
      'organization': instance.organization,
    };
