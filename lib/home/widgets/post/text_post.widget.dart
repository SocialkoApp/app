import 'package:app/home/widgets/post/post_author.widget.dart';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:app/home/api/models/post.response.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class TextPost extends StatelessWidget {
  const TextPost({super.key, required this.post});

  final PostResponse post;

  @override
  Widget build(BuildContext context) {
    String assignProfilePicture(ProfilePicture? pfp) {
      if (pfp == null) {
        return 'https://cdn.socialko.cc/assets/default_pfp.png';
      }

      return pfp.url;
    }

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
            child: PostAuthor(
              pfp: assignProfilePicture(post.author.profilePicture),
              name: '${post.author.firstName} ${post.author.lastName}',
              role: '${post.author.cult?.role}',
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              '${post.title}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppAssets.colors.light,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
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
          ),
        ],
      ),
    );
  }
}
