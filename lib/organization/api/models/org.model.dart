import 'package:app/organization/api/models/count.response.dart';
import 'package:app/organization/api/models/member_model.dart';
import 'package:app/home/api/models/image.response.dart';
import 'package:app/profile/api/models/profile.response.dart';

class OrganizationModel {
  OrganizationModel({
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

  final List<MemberModel>? members;
  final List<ProfileResponse>? joinRequests;

  final CountResponse count;

  final String? role;
}
