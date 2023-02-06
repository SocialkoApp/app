import 'package:app/home/utils/post.data.dart';
import 'package:app/home/widgets/post/actions_row.widget.dart';
import 'package:app/home/widgets/post/post_author.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class TextPost extends StatelessWidget {
  const TextPost({super.key, required this.post});

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppAssets.styles.borderRadius),
        color: AppAssets.colors.darkHighlight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: PostAuthor(profile: post.data.author),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              '${post.data.title}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppAssets.colors.light,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          PostActions(post: post),
        ],
      ),
    );
  }
}
