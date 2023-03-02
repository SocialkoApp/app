import 'package:json_annotation/json_annotation.dart';

part 'update_cult.dto.g.dart';

@JsonSerializable()
class UpdateCultDto {
  UpdateCultDto({
    this.name,
    this.description,
  });

  final String? name;
  final String? description;

  factory UpdateCultDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateCultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCultDtoToJson(this);
}
