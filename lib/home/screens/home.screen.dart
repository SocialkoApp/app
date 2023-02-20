import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/home/screens/create_image_post.screen.dart';
import 'package:app/home/widgets/feed_text.widget.dart';
import 'package:app/home/widgets/header.widget.dart';
import 'package:app/home/widgets/home/create_post.widget.dart';
import 'package:app/home/widgets/post/posts.widget.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static String routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(asyncMeProvider);

    return p.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (profile) => Scaffold(
        backgroundColor: AppAssets.colors.dark,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            Header(profile: profile),
            const FeedText(),
            const SizedBox(height: 10.0),
            profile.cult != null
                ? const PostsWidget()
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Text(
                        'You are not in a cult',
                        style: TextStyle(
                          color: AppAssets.colors.light,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: CreatePostButton(
          onPressedImage: () => Navigator.of(context).pushNamed(
            CreateImagePost.routeName,
          ),
          onPressedText: () => {},
        ),
      ),
    );
  }
}
