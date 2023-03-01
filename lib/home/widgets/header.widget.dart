import 'package:app/common/screens/initializing.screen.dart';
import 'package:app/home/screens/create_image_post.screen.dart';
import 'package:app/home/screens/create_text_post.screen.dart';
import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/profile/screens/profile.screen.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/pfp.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.profile,
  });

  final ProfileResponse profile;

  @override
  Widget build(BuildContext context) {
    String subtitle() {
      if (profile.cult != null) {
        return '@${profile.user.username} • ${profile.cult?.cult?.name} [${profile.cult?.role}]';
      }

      return '@${profile.user.username}';
    }

    void openProfile(String username) {
      Navigator.pushNamed(
        context,
        ProfileScreen.routeName,
        arguments: ProfileArgs(
          username,
          me: true,
        ),
      );
    }

    void redirect(String route) {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(route);
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => openProfile(profile.user.username),
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
                      subtitle(),
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
          ),
          IconButton(
            onPressed: () => showDialog(
              barrierDismissible: true,
              barrierColor: Colors.transparent,
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 60.0, 12.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () => redirect(CreateImagePost.routeName),
                      backgroundColor: AppAssets.colors.primary,
                      foregroundColor: AppAssets.colors.light,
                      label: const Text('Image'),
                      icon: const Icon(IconlyBold.image),
                    ),
                    const SizedBox(height: 10.0),
                    FloatingActionButton.extended(
                      onPressed: () => redirect(CreateTextPost.routeName),
                      backgroundColor: AppAssets.colors.primary,
                      foregroundColor: AppAssets.colors.light,
                      label: const Text('Text'),
                      icon: const Icon(IconlyBold.document),
                    ),
                  ],
                ),
              ),
            ),
            icon: Icon(
              IconlyLight.plus,
              size: 35.0,
              color: AppAssets.colors.light,
            ),
          ),
        ],
      ),
    );
  }
}
