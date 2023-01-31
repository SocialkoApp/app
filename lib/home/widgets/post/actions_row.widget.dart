import 'package:app/home/api/models/post.response.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class PostActions extends StatelessWidget {
  const PostActions({super.key, required this.post});

  final PostResponse post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => print('upvote'),
              icon: Icon(
                IconlyBold.arrowUp,
                color: AppAssets.colors.light,
              ),
            ),
            Text(
              post.score.toString(),
              style: TextStyle(
                color: AppAssets.colors.light,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () => print('downvote'),
              icon: Icon(
                IconlyBold.arrowDown,
                color: AppAssets.colors.light,
              ),
            ),
            IconButton(
              onPressed: () => print('comment'),
              icon: Icon(
                IconlyBold.chat,
                color: AppAssets.colors.light,
              ),
            ),
            Text(
              '20',
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
