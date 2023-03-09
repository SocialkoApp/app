import 'package:json_annotation/json_annotation.dart';

part 'create.dto.g.dart';

@JsonSerializable()
class CreateCultDto {
  CreateCultDto({
    required this.name,
    required this.description,
    required this.iconId,
  });

  final String name;
  final String description;
  final String iconId;

  factory CreateCultDto.fromJson(Map<String, dynamic> json) =>
      _$CreateCultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCultDtoToJson(this);
}
