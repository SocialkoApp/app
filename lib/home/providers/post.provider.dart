import 'package:app/home/api/map_profile.util.dart';
import 'package:app/home/api/models/post.model.dart';
import 'package:app/home/api/models/vote.model.dart';
import 'package:app/home/providers/posts.provider.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post.provider.g.dart';

@riverpod
class AsyncPost extends _$AsyncPost {
  Future<PostModel> _fetchPost(String id) async {
    final resp = await API.home.posts.getSingle(id);

    return mapPost(resp);
  }

  @override
  FutureOr<PostModel> build(String id) {
    return _fetchPost(id);
  }

  Future<void> votePost(String id, String type) async {
    state = await AsyncValue.guard(() async {
      await API.home.posts.vote(id, type);

      return _fetchPost(id);
    });

    ref.invalidate(asyncPostsProvider);
  }

  bool isUpvoted(List<VoteModel> votes) {
    final profile = ref.read(asyncMeProvider);

    bool upvoted = false;

    profile.whenData((p) {
      final v = votes.where(
        (e) => e.profile.id == p.id && e.type == "Upvote",
      );

      v.isNotEmpty ? upvoted = true : upvoted = false;
    });

    return upvoted;
  }

  bool isDownvoted(List<VoteModel> votes) {
    final profile = ref.watch(asyncMeProvider);

    bool downvoted = false;

    profile.whenData((p) {
      final v = votes.where(
        (e) => e.profile.id == p.id && e.type == "Downvote",
      );

      v.isNotEmpty ? downvoted = true : downvoted = false;
    });

    return downvoted;
  }
}
