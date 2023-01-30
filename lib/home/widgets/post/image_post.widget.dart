import 'package:app/home/widgets/post/post_author.widget.dart';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/gestures.dart';
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
        if (post.description!.length > 102) {
          return '${post.description!.substring(0, 89)}...';
        }
      }

      return post.description;
    }

    TextSpan showMoreSpan() {
      if (post.description != null) {
        if (post.description!.length > 102) {
          return TextSpan(
            text: 'Show more',
            style: TextStyle(
              color: AppAssets.colors.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => {
                    print('Tapped show more'),
                  },
          );
        }
      }

      return const TextSpan();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostAuthor(
          pfp: assignProfilePicture(post.author.profilePicture),
          name: '${post.author.firstName} ${post.author.lastName}',
          role: '${post.author.cult?.role}',
        ),
        const SizedBox(height: 10.0),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppAssets.styles.borderRadius * 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppAssets.colors.lightHighlight,
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
          ],
        ),
        const SizedBox(height: 10.0),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: AppAssets.colors.light,
            ),
            children: [
              TextSpan(
                text: descriptionCut(),
              ),
              showMoreSpan(),
            ],
          ),
        ),
      ],
    );
  }
}
