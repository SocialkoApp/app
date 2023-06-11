import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/pfp.util.dart';
import 'package:flutter/material.dart';

class PostAuthor extends StatelessWidget {
  const PostAuthor({
    super.key,
    required this.profile,
  });

  final ProfileResponse profile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              assignProfilePicture(profile.profilePicture),
              width: 55.0,
              height: 55.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${profile.firstName} ${profile.lastName}',
                style: TextStyle(
                  fontSize: 14,
                  color: AppAssets.colors.light,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '@${profile.user.username} • ${profile.organization?.role}',
                style: TextStyle(
                  fontSize: 12,
                  color: AppAssets.colors.lightHighlight,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
