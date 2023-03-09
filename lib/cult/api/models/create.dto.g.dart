// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCultDto _$CreateCultDtoFromJson(Map<String, dynamic> json) =>
    CreateCultDto(
      name: json['name'] as String,
      description: json['description'] as String,
      iconId: json['iconId'] as String,
    );

Map<String, dynamic> _$CreateCultDtoToJson(CreateCultDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'iconId': instance.iconId,
    };
