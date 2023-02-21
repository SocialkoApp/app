import 'package:app/cult/api/models/count.response.dart';
import 'package:app/home/api/models/image.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cult.response.g.dart';

@JsonSerializable()
class CultResponse {
  CultResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.count,
  });

  final String id;

  final String name;
  final String description;

  final ImageResponse? icon;

  @JsonKey(name: '_count')
  final CountResponse count;

  factory CultResponse.fromJson(Map<String, dynamic> json) =>
      _$CultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CultResponseToJson(this);
}
