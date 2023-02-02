import 'package:app/home/api/models/post.response.dart';
import 'package:app/home/api/models/temp_post.response.dart';
import 'package:app/profile/api/models/profile.response.dart';

PostResponse mapPost(Map<String, dynamic> p) {
  final t = TempPostResponse.fromJson(p);

  final u = t.upvotes;
  final d = t.downvotes;

  List<ProfileResponse> upvotes =
      u.map((p) => ProfileResponse.fromJson(p["profile"])).toList();

  List<ProfileResponse> downvotes =
      d.map((p) => ProfileResponse.fromJson(p["profile"])).toList();

  final PostResponse post = PostResponse(
    id: t.id,
    upvotes: upvotes,
    downvotes: downvotes,
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

List<PostResponse> mapPosts(List<dynamic> p) {
  final List<PostResponse> posts = p.map((e) => mapPost(e)).toList();

  return posts;
}
