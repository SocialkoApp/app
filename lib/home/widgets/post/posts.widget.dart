import 'package:app/common/screens/error.screen.dart';
import 'package:app/home/providers/posts.provider.dart';
import 'package:app/home/screens/post.screen.dart';
import 'package:app/home/utils/post.data.dart';
import 'package:app/home/widgets/post/image/home.widget.dart';
import 'package:app/home/widgets/post/text/home.widget.dart';
import 'package:app/utils/assets.util.dart';
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

    Future<void> refresh() async {
      return ref.invalidate(asyncPostsProvider);
    }

    return p.when(
      loading: () => Center(
        child: CircularProgressIndicator(
          color: AppAssets.colors.primary,
        ),
      ),
      error: (err, stack) => ErrorScreen(error: err),
      data: (posts) => Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: SizedBox(
          height: height * 0.75,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: RefreshIndicator(
                onRefresh: () => refresh(),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    final data = posts[i];
                    final upvoted = ref
                        .watch(asyncPostsProvider.notifier)
                        .isUpvoted(data.votes);
                    final downvoted = ref
                        .watch(asyncPostsProvider.notifier)
                        .isDownvoted(data.votes);

                    final post = PostData(
                      data: data,
                      upvoted: upvoted,
                      downvoted: downvoted,
                      vote: votePost,
                    );

                    if (i == posts.length - 1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () => openPost(post.data.id),
                          child: post.data.type == "Image"
                              ? ImagePost(post: post)
                              : TextPost(post: post),
                        ),
                      );
                    }

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
          ),
        ),
      ),
    );
  }
}
