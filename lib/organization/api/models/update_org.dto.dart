import 'package:json_annotation/json_annotation.dart';

part 'update_org.dto.g.dart';

@JsonSerializable()
class UpdateOrgDto {
  UpdateOrgDto({
    this.name,
    this.description,
  });

  final String? name;
  final String? description;

  factory UpdateOrgDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrgDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateOrgDtoToJson(this);
}
