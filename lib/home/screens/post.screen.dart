import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/home/providers/post.provider.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  static String routeName = '/post';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Args;

    final post = ref.watch(postProvider.call(args.id));

    return post.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (p) => Scaffold(
        backgroundColor: AppAssets.colors.dark,
        body: Center(
          child: Text(
            '${p.id} : ${p.author.firstName}',
            style: TextStyle(
              color: AppAssets.colors.light,
            ),
          ),
        ),
      ),
    );
  }
}

class Args {
  Args(this.id);

  final String id;
}
