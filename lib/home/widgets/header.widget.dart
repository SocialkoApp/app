import 'package:app/common/screens/initializing.screen.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.pfp,
    required this.name,
    required this.cult,
    required this.role,
  });

  final String pfp;
  final String name;
  final String cult;
  final String role;

  @override
  Widget build(BuildContext context) {
    void logout() {
      API.auth.deleteToken();
      Navigator.of(context).pushNamedAndRemoveUntil(
        InitializingScreen.routeName,
        (Route<dynamic> route) => false,
      );
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
                    pfp,
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
                      name,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppAssets.colors.light,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$cult [$role]',
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
