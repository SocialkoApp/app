import 'package:app/home/api/models/post.model.dart';

class PostData {
  PostData({
    required this.data,
    required this.upvoted,
    required this.downvoted,
    required this.vote,
  });

  final PostModel data;

  final bool upvoted;
  final bool downvoted;

  final Function(String, String) vote;
}
