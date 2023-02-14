import 'package:app/home/utils/post.data.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class PostActions extends StatelessWidget {
  const PostActions({super.key, required this.post});

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => post.vote(post.data.id, "upvote"),
              icon: Icon(
                IconlyBold.arrowUp,
                color: post.upvoted
                    ? AppAssets.colors.primary
                    : AppAssets.colors.light,
              ),
            ),
            Text(
              post.data.score.toString(),
              style: TextStyle(
                color: post.upvoted || post.downvoted
                    ? AppAssets.colors.primary
                    : AppAssets.colors.light,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () => post.vote(post.data.id, "downvote"),
              icon: Icon(
                IconlyBold.arrowDown,
                color: post.downvoted
                    ? AppAssets.colors.primary
                    : AppAssets.colors.light,
              ),
            ),
            const SizedBox(width: 10.0),
            Icon(
              IconlyBold.chat,
              color: AppAssets.colors.light,
            ),
            const SizedBox(width: 10.0),
            Text(
              post.data.comments.length.toString(),
              style: TextStyle(
                color: AppAssets.colors.light,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () => print('share'),
          icon: Icon(
            IconlyBold.send,
            color: AppAssets.colors.light,
          ),
        ),
      ],
    );
  }
}
