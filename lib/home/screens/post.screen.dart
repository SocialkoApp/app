import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/home/api/models/add_comment.dto.dart';
import 'package:app/home/api/models/comment.model.dart';
import 'package:app/home/providers/post.provider.dart';
import 'package:app/home/utils/post.data.dart';
import 'package:app/home/widgets/post/comment.widget.dart';
import 'package:app/home/widgets/post/full_actions.widget.dart';
import 'package:app/home/widgets/post/image/full.widget.dart';
import 'package:app/home/widgets/post/post_author.widget.dart';
import 'package:app/home/widgets/post/text/full.widget.dart';
import 'package:app/profile/screens/profile.screen.dart';
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
    final height = MediaQuery.of(context).size.height;

    final commentController = TextEditingController();

    final post = ref.watch(asyncPostProvider.call(args.id));

    List<Widget> renderComments(List<CommentModel> c) {
      List<Widget> items = [];

      for (int i = 0; i < c.length; i++) {
        items.add(CommentWidget(c: c[i]));
        items.add(const SizedBox(height: 20.0));
      }

      return items;
    }

    void openProfile(String username) {
      Navigator.pushNamed(
        context,
        ProfileScreen.routeName,
        arguments: ProfileArgs(username),
      );
    }

    void votePost(String id, String type) {
      ref
          .read(asyncPostProvider.call(args.id).notifier)
          .votePost(args.id, type);
    }

    void addComment() {
      final body = AddCommentDto(
        postId: args.id,
        content: commentController.text,
      );

      ref.read(asyncPostProvider.call(args.id).notifier).addComment(body);
    }

    return post.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (p) {
        return Scaffold(
          backgroundColor: AppAssets.colors.dark,
          body: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 45.0),
                    const BackWidget(),
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
                      child: GestureDetector(
                        onTap: () => openProfile(p.author.user.username),
                        child: PostAuthor(profile: p.author),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    p.type == "Image"
                        ? FullImagePost(p: p)
                        : FullTextPost(p: p),
                    const SizedBox(height: 10.0),
                    FullPostActions(
                      post: PostData(
                        data: p,
                        upvoted: ref
                            .watch(asyncPostProvider.call(args.id).notifier)
                            .isUpvoted(p.votes),
                        downvoted: ref
                            .watch(asyncPostProvider.call(args.id).notifier)
                            .isDownvoted(p.votes),
                        vote: votePost,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Divider(
                        color: AppAssets.colors.lightHighlight,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Column(
                      children: renderComments(p.comments),
                    ),
                    SizedBox(height: height * 0.1),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'add new comment',
                      suffixIcon: IconButton(
                        onPressed: () => addComment(),
                        icon: Icon(
                          IconlyBold.send,
                          color: AppAssets.colors.primary,
                        ),
                      ),
                    ),
                    maxLines: null,
                    controller: commentController,
                  ),
                ),
              ),
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
