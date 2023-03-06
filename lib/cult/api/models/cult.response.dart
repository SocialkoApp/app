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
    required this.members,
    required this.joinRequests,
    required this.count,
    required this.role,
  });

  final String id;

  final String name;
  final String description;

  final ImageResponse? icon;

  final List<Map<String, dynamic>>? members;
  final List<Map<String, dynamic>>? joinRequests;

  @JsonKey(name: '_count')
  final CountResponse count;

  final String? role;

  factory CultResponse.fromJson(Map<String, dynamic> json) =>
      _$CultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CultResponseToJson(this);
}
