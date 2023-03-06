import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/profile/screens/profile.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/pfp.util.dart';
import 'package:flutter/material.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({
    super.key,
    required this.profile,
    required this.accept,
    required this.decline,
  });

  final ProfileResponse profile;
  final Function() accept;
  final Function() decline;

  @override
  Widget build(BuildContext context) {
    void openProfile(String username) {
      Navigator.pushNamed(
        context,
        ProfileScreen.routeName,
        arguments: ProfileArgs(username),
      );
    }

    return GestureDetector(
      onTap: () => openProfile(profile.user.username),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                    '@${profile.user.username}',
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
          Row(
            children: [
              IconButton(
                onPressed: accept,
                icon: Icon(
                  Icons.check,
                  color: AppAssets.colors.lightHighlight,
                ),
              ),
              IconButton(
                onPressed: decline,
                icon: Icon(
                  Icons.close,
                  color: AppAssets.colors.lightHighlight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
