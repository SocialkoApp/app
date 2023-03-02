import 'package:app/cult/api/models/count.response.dart';
import 'package:app/cult/api/models/member_model.dart';
import 'package:app/home/api/models/image.response.dart';

class CultModel {
  CultModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.members,
    required this.count,
    required this.role,
  });

  final String id;

  final String name;
  final String description;

  final ImageResponse? icon;

  final List<MemberModel>? members;

  final CountResponse count;

  final String? role;
}
