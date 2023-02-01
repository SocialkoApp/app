import 'package:app/home/widgets/post/actions_row.widget.dart';
import 'package:app/home/widgets/post/post_author.widget.dart';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:app/home/api/models/post.response.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({super.key, required this.post});

  final PostResponse post;

  @override
  Widget build(BuildContext context) {
    String assignProfilePicture(ProfilePicture? pfp) {
      if (pfp == null) {
        return 'https://cdn.socialko.cc/assets/default_pfp.png';
      }

      return pfp.url;
    }

    String? descriptionCut() {
      if (post.description != null) {
        if (post.description!.length > 50) {
          return '${post.description!.substring(0, 48)}...';
        }
      }

      return post.description;
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppAssets.styles.borderRadius * 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppAssets.colors.dark,
                    blurRadius: 5.0,
                    offset: const Offset(5.0, 1.0),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppAssets.styles.borderRadius,
                ),
                child: Image.network('${post.image?.url}'),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              '${descriptionCut()}',
              style: TextStyle(color: AppAssets.colors.light),
            ),
          ),
          PostActions(post: post),
        ],
      ),
    );
  }
}
