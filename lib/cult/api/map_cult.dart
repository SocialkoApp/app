import 'package:app/cult/api/models/cult.model.dart';
import 'package:app/cult/api/models/cult.response.dart';
import 'package:app/cult/api/models/member_model.dart';
import 'package:app/profile/api/models/profile.response.dart';

CultModel mapCult(Map<String, dynamic> c) {
  final t = CultResponse.fromJson(c);

  final m = t.members;

  List<MemberModel>? members;

  if (m != null) {
    members = m
        .map((m) => MemberModel(
              member: ProfileResponse.fromJson(m["member"]),
              role: m["role"],
            ))
        .toList();
  }

  final CultModel cult = CultModel(
    id: t.id,
    name: t.name,
    description: t.description,
    icon: t.icon,
    members: members,
    count: t.count,
    role: t.role,
  );

  return cult;
}
