import 'package:app/home/widgets/post/post_author.widget.dart';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:app/home/api/models/post.response.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostAuthor(
              pfp: assignProfilePicture(post.author.profilePicture),
              name: '${post.author.firstName} ${post.author.lastName}',
              role: '${post.author.cult?.role}',
            ),
            const SizedBox(height: 10.0),
            Text(
              '${post.title}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppAssets.colors.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
