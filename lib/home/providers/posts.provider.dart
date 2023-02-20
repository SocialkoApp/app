import 'dart:io';

import 'package:app/home/api/map_profile.util.dart';
import 'package:app/home/api/models/create_post.dto.dart';
import 'package:app/home/api/models/image.response.dart';
import 'package:app/home/api/models/post.model.dart';
import 'package:app/home/api/models/vote.model.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/utils/api/api.client.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts.provider.g.dart';

@riverpod
class AsyncPosts extends _$AsyncPosts {
  Future<List<PostModel>> _fetchPosts() async {
    final p = await API.home.posts.get();

    return mapPosts(p);
  }

  @override
  FutureOr<List<PostModel>> build() async {
    return _fetchPosts();
  }

  FutureOr<PostModel> fetchPost(String id) async {
    final resp = await API.home.posts.getSingle(id);

    return mapPost(resp);
  }

  FutureOr<void> createPost(
    String type, {
    String? description,
    String? title,
    File? file,
  }) async {
    state = const AsyncValue.loading();

    CreatePostDto dto = CreatePostDto(
      type: type,
      description: description,
      title: title,
    );

    if (file != null) {
      final uploaded =
          ImageResponse.fromJson(await ApiClient.postImage('/files', file));

      dto = CreatePostDto(
        type: type,
        description: description,
        title: title,
        imageId: uploaded.id,
      );
    }

    state = await AsyncValue.guard(() async {
      await API.home.posts.create(dto);

      return _fetchPosts();
    });
  }

  Future<void> votePost(String id, String type) async {
    state = await AsyncValue.guard(() async {
      await API.home.posts.vote(id, type);

      return _fetchPosts();
    });
  }

  bool isUpvoted(List<VoteModel> votes) {
    final profile = ref.read(asyncMeProvider);

    bool upvoted = false;

    profile.when(
      loading: () => {},
      error: (e, s) => {},
      data: (p) {
        final v = votes.where(
          (e) => e.profile.id == p.id && e.type == "Upvote",
        );

        v.isNotEmpty ? upvoted = true : upvoted = false;
      },
    );

    return upvoted;
  }

  bool isDownvoted(List<VoteModel> votes) {
    final profile = ref.watch(asyncMeProvider);

    bool downvoted = false;

    profile.when(
      loading: () => {},
      error: (e, s) => {},
      data: (p) {
        final v = votes.where(
          (e) => e.profile.id == p.id && e.type == "Downvote",
        );

        v.isNotEmpty ? downvoted = true : downvoted = false;
      },
    );

    return downvoted;
  }
}

final postsFamily =
    FutureProvider.family<PostModel, String>((ref, postId) async {
  final posts = ref.read(asyncPostsProvider.notifier);
  // final posts = ref.watch(asyncPostsProvider);
  return await posts.fetchPost(postId);
});
