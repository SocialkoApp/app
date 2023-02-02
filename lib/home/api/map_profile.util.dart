import 'package:app/home/api/models/post.model.dart';
import 'package:app/home/api/models/temp_post.response.dart';
import 'package:app/home/api/models/vote.model.dart';
import 'package:app/profile/api/models/profile.response.dart';

PostModel mapPost(Map<String, dynamic> p) {
  final t = TempPostResponse.fromJson(p);

  final v = t.votes;

  List<VoteModel> votes = v
      .map((p) => VoteModel(
            profile: ProfileResponse.fromJson(p["profile"]),
            type: p["type"],
          ))
      .toList();

  final PostModel post = PostModel(
    id: t.id,
    votes: votes,
    title: t.title,
    description: t.description,
    image: t.image,
    author: t.author,
    score: t.score,
    type: t.type,
    createdAt: t.createdAt,
  );

  return post;
}

List<PostModel> mapPosts(List<dynamic> p) {
  final List<PostModel> posts = p.map((e) => mapPost(e)).toList();

  return posts;
}
