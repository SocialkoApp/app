import 'package:app/common/screens/initializing.screen.dart';
import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/pfp.util.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.profile,
  });

  final ProfileResponse profile;

  @override
  Widget build(BuildContext context) {
    void logout() {
      API.auth.deleteToken();
      Navigator.of(context).pushNamedAndRemoveUntil(
        InitializingScreen.routeName,
        (Route<dynamic> route) => false,
      );
    }

    String subtitle() {
      if (profile.cult != null) {
        return '@${profile.user.username} • ${profile.cult?.cult?.name} [${profile.cult?.role}]';
      }

      return '@${profile.user.username}';
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
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
            onPressed: () => logout(),
            icon: Icon(
              Icons.settings,
              size: 35.0,
              color: AppAssets.colors.light,
            ),
          )
        ],
      ),
    );
  }
}
