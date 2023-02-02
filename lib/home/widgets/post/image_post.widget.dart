import 'package:app/home/utils/post.data.dart';
import 'package:app/home/widgets/post/actions_row.widget.dart';
import 'package:app/home/widgets/post/post_author.widget.dart';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({super.key, required this.post});

  final PostData post;

  @override
  Widget build(BuildContext context) {
    String assignProfilePicture(ProfilePicture? pfp) {
      if (pfp == null) {
        return 'https://cdn.socialko.cc/assets/default_pfp.png';
      }

      return pfp.url;
    }

    String? descriptionCut() {
      if (post.data.description != null) {
        if (post.data.description!.length > 50) {
          return '${post.data.description!.substring(0, 48)}...';
        }
      }

      return post.data.description;
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
              pfp: assignProfilePicture(post.data.author.profilePicture),
              name:
                  '${post.data.author.firstName} ${post.data.author.lastName}',
              role: '${post.data.author.cult?.role}',
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
                child: Image.network('${post.data.image?.url}'),
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
