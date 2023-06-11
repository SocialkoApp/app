// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_join_request.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgJoinRequest _$OrgJoinRequestFromJson(Map<String, dynamic> json) =>
    OrgJoinRequest(
      org: OrganizationResponse.fromJson(json['org'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrgJoinRequestToJson(OrgJoinRequest instance) =>
    <String, dynamic>{
      'org': instance.org,
    };
