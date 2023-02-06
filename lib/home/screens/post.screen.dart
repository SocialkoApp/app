import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/home/providers/posts.provider.dart';
import 'package:app/home/widgets/post/post_author.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  static String routeName = '/post';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Args;

    final post = ref.watch(postsFamily(args.id));

    void goBack() {
      Navigator.of(context).pop();
    }

    return post.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (p) {
        return Scaffold(
          backgroundColor: AppAssets.colors.dark,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45.0),
              Row(
                children: [
                  IconButton(
                    onPressed: () => goBack(),
                    icon: Icon(
                      IconlyBold.arrowLeft2,
                      color: AppAssets.colors.light,
                      size: 30.0,
                    ),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: AppAssets.colors.light,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: AppAssets.colors.lightHighlight,
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PostAuthor(profile: p.author),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppAssets.styles.borderRadius,
                  ),
                  child: Image.network('${p.image?.url}'),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '@${p.author.user.username}',
                        style: TextStyle(
                          color: AppAssets.colors.light,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' - ${p.description}',
                        style: TextStyle(
                          color: AppAssets.colors.light,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: AppAssets.colors.lightHighlight,
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        );
      },
    );
  }
}

class Args {
  Args(this.id);

  final String id;
}
