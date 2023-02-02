import 'package:app/home/api/models/image.response.dart';
import 'package:app/home/api/models/vote.model.dart';
import 'package:app/profile/api/models/profile.response.dart';

class PostModel {
  PostModel({
    required this.id,
    required this.votes,
    required this.title,
    required this.description,
    required this.image,
    required this.author,
    required this.score,
    required this.type,
    required this.createdAt,
  });

  final String id;

  final List<VoteModel> votes;

  final String? title;
  final String? description;

  final ProfileResponse author;

  final ImageResponse? image;

  final num score;
  final String type;

  final String createdAt;
}
