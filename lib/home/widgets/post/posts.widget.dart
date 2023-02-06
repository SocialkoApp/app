import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/home/providers/posts.provider.dart';
import 'package:app/home/screens/post.screen.dart';
import 'package:app/home/utils/post.data.dart';
import 'package:app/home/widgets/post/image_post.widget.dart';
import 'package:app/home/widgets/post/text_post.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsWidget extends ConsumerWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    final p = ref.watch(asyncPostsProvider);

    void votePost(String id, String type) {
      ref.read(asyncPostsProvider.notifier).votePost(id, type);
    }

    void openPost(String id) {
      Navigator.pushNamed(
        context,
        PostScreen.routeName,
        arguments: Args(id),
      );
    }

    Widget separator() {
      return const SizedBox(height: 15.0);
    }

    return p.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (posts) => SizedBox(
        height: height * 0.75,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              final data = posts[i];
              final upvoted =
                  ref.watch(asyncPostsProvider.notifier).isUpvoted(data.votes);
              final downvoted = ref
                  .watch(asyncPostsProvider.notifier)
                  .isDownvoted(data.votes);

              final post = PostData(
                data: data,
                upvoted: upvoted,
                downvoted: downvoted,
                vote: votePost,
              );

              return GestureDetector(
                onTap: () => openPost(post.data.id),
                child: post.data.type == "Image"
                    ? ImagePost(post: post)
                    : TextPost(post: post),
              );
            },
            separatorBuilder: (c, i) => separator(),
            itemCount: posts.length,
          ),
        ),
      ),
    );
  }
}
