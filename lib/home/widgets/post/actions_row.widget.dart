import 'package:app/home/api/map_profile.util.dart';
import 'package:app/home/api/models/post.response.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class PostActions extends StatefulWidget {
  PostActions({super.key, required this.post});

  PostResponse post;

  @override
  State<PostActions> createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  @override
  void initState() {
    super.initState();
  }

  void votePost(VoteType type) async {
    final vote = await API.home.posts.vote(widget.post.id, type);

    setState(() {
      widget.post = mapPost(vote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => votePost(VoteType.upvote),
              icon: Icon(
                IconlyBold.arrowUp,
                color: AppAssets.colors.light,
              ),
            ),
            Text(
              widget.post.score.toString(),
              style: TextStyle(
                color: AppAssets.colors.light,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () => votePost(VoteType.downvote),
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

enum VoteType {
  upvote,
  downvote,
}
