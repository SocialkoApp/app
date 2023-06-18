import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/home/widgets/org/org.widget.dart';
import 'package:app/home/widgets/org/orgs.widget.dart';
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
        data: (profile) {
          print(profile);

          return Scaffold(
            backgroundColor: AppAssets.colors.dark,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40.0),
                Header(profile: profile),
                TopText(
                  isInOrg: profile.organization != null,
                  hasJoinRequest: profile.organizationJoinRequest != null,
                ),
                const SizedBox(height: 10.0),
                profile.organization != null
                    ? const PostsWidget()
                    : profile.organizationJoinRequest == null
                        ? const OrgsWidget()
                        : OrganizationWidget(
                            org: profile.organizationJoinRequest!.organization,
                            onJoin: null,
                          ),
              ],
            ),
          );
        });
  }
}
