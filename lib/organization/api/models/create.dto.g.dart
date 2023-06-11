// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrgDto _$CreateOrgDtoFromJson(Map<String, dynamic> json) => CreateOrgDto(
      name: json['name'] as String,
      description: json['description'] as String,
      iconId: json['iconId'] as String,
    );

Map<String, dynamic> _$CreateOrgDtoToJson(CreateOrgDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'iconId': instance.iconId,
    };
