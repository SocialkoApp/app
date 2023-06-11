import 'package:app/organization/api/models/count.response.dart';
import 'package:app/home/api/models/image.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'org.response.g.dart';

@JsonSerializable()
class OrganizationResponse {
  OrganizationResponse({
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

  factory OrganizationResponse.fromJson(Map<String, dynamic> json) =>
      _$OrganizationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationResponseToJson(this);
}
