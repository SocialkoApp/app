import 'package:app/profile/api/models/profile.response.dart';

class MemberModel {
  MemberModel({
    required this.member,
    required this.role,
  });

  final ProfileResponse member;
  final String role;
}
