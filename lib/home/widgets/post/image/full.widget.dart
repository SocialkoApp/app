import 'package:app/home/api/models/post.model.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class FullImagePost extends StatelessWidget {
  const FullImagePost({super.key, required this.p});

  final PostModel p;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              AppAssets.styles.borderRadius,
            ),
            child: Image.network('${p.image?.url}'),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '@${p.author.user.username}',
                    style: TextStyle(
                      color: AppAssets.colors.light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' - ${p.description}',
                    style: TextStyle(
                      color: AppAssets.colors.light,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
