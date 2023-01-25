import 'package:json_annotation/json_annotation.dart';

part 'cult_data.response.g.dart';

@JsonSerializable()
class ProfileCultData {
  ProfileCultData({
    required this.name,
    required this.id,
  });

  final String name;
  final String id;

  factory ProfileCultData.fromJson(Map<String, dynamic> json) =>
      _$ProfileCultDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCultDataToJson(this);
}
