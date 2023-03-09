import 'package:app/home/utils/post.data.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FullPostActions extends StatelessWidget {
  const FullPostActions({super.key, required this.post});

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
        ],
      ),
    );
  }
}
