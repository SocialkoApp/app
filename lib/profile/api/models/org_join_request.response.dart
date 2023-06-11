import 'package:app/organization/api/models/org.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'org_join_request.response.g.dart';

@JsonSerializable()
class OrgJoinRequest {
  OrgJoinRequest({
    required this.org,
  });

  final OrganizationResponse org;

  factory OrgJoinRequest.fromJson(Map<String, dynamic> json) =>
      _$OrgJoinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrgJoinRequestToJson(this);
}
