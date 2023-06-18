import 'package:app/organization/api/models/org.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'org.response.g.dart';

@JsonSerializable()
class ProfileOrg {
  ProfileOrg({
    required this.organization,
    required this.role,
  });

  final OrganizationResponse? organization;
  final String? role;

  factory ProfileOrg.fromJson(Map<String, dynamic> json) =>
      _$ProfileOrgFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileOrgToJson(this);
}
