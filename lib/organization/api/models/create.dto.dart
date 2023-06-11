import 'package:json_annotation/json_annotation.dart';

part 'create.dto.g.dart';

@JsonSerializable()
class CreateOrgDto {
  CreateOrgDto({
    required this.name,
    required this.description,
    required this.iconId,
  });

  final String name;
  final String description;
  final String iconId;

  factory CreateOrgDto.fromJson(Map<String, dynamic> json) =>
      _$CreateOrgDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrgDtoToJson(this);
}
