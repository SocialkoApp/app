import 'package:app/cult/api/models/cult.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cult.response.g.dart';

@JsonSerializable()
class ProfileCult {
  ProfileCult({
    required this.cult,
    required this.role,
  });

  final CultResponse? cult;
  final String role;

  factory ProfileCult.fromJson(Map<String, dynamic> json) =>
      _$ProfileCultFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCultToJson(this);
}
