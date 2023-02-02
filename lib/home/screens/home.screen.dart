import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/home/providers/posts.provider.dart';
import 'package:app/home/utils/post.data.dart';
import 'package:app/home/widgets/feed_text.widget.dart';
import 'package:app/home/widgets/header.widget.dart';
import 'package:app/home/widgets/post/image_post.widget.dart';
import 'package:app/home/widgets/post/text_post.widget.dart';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static String routeName = '/';

  String assignProfilePicture(ProfilePicture? pfp) {
    if (pfp == null) {
      return 'https://cdn.socialko.cc/assets/default_pfp.png';
    }

    return pfp.url;
  }

  Widget separator() {
    return const SizedBox(height: 15.0);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    final pr = ref.watch(meProvider);
    final po = ref.watch(asyncPostsProvider);

    void votePost(String id, String type) {
      ref.read(asyncPostsProvider.notifier).votePost(id, type);
    }

    return pr.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (profile) => po.when(
        loading: () => const LoadingScreen(),
        error: (err, stack) => ErrorScreen(error: err),
        data: (posts) => Scaffold(
          backgroundColor: AppAssets.colors.dark,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0),
              Header(
                pfp: assignProfilePicture(profile.profilePicture),
                name: '${profile.firstName} ${profile.lastName}',
                cult: '${profile.cult?.cult?.name}',
                role: '${profile.cult?.role}',
              ),
              const FeedText(),
              SizedBox(
                height: height * 0.75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

                      return post.data.type == "Image"
                          ? ImagePost(post: post)
                          : TextPost(post: post);
                    },
                    separatorBuilder: (c, i) => separator(),
                    itemCount: posts.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
