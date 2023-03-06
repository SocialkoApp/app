// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cult.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CultResponse _$CultResponseFromJson(Map<String, dynamic> json) => CultResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] == null
          ? null
          : ImageResponse.fromJson(json['icon'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      joinRequests: (json['joinRequests'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      count: CountResponse.fromJson(json['_count'] as Map<String, dynamic>),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$CultResponseToJson(CultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'members': instance.members,
      'joinRequests': instance.joinRequests,
      '_count': instance.count,
      'role': instance.role,
    };
