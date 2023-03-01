import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/home/widgets/cult/cult.widget.dart';
import 'package:app/home/widgets/cult/cults.widget.dart';
import 'package:app/home/widgets/feed_text.widget.dart';
import 'package:app/home/widgets/header.widget.dart';
import 'package:app/home/widgets/post/posts.widget.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

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
            TopText(
              isInCult: profile.cult != null,
              hasJoinRequest: profile.cultJoinRequest != null,
            ),
            const SizedBox(height: 10.0),
            profile.cult != null
                ? const PostsWidget()
                : profile.cultJoinRequest == null
                    ? const CultsWidget()
                    : CultWidget(
                        cult: profile.cultJoinRequest!.cult,
                        onJoin: null,
                      ),
          ],
        ),
      ),
    );
  }
}
