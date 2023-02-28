// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cult_join_request.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CultJoinRequest _$CultJoinRequestFromJson(Map<String, dynamic> json) =>
    CultJoinRequest(
      cult: CultResponse.fromJson(json['cult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CultJoinRequestToJson(CultJoinRequest instance) =>
    <String, dynamic>{
      'cult': instance.cult,
    };
