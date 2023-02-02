import 'package:app/profile/api/models/profile.response.dart';

class VoteModel {
  VoteModel({
    required this.profile,
    required this.type,
  });

  final ProfileResponse profile;
  final String type;
}
