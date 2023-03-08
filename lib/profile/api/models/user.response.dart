import 'package:json_annotation/json_annotation.dart';

part 'user.response.g.dart';

@JsonSerializable()
class ProfileUser {
  ProfileUser({
    required this.username,
    required this.email,
  });

  final String username;
  final String? email;

  factory ProfileUser.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUserToJson(this);
}
