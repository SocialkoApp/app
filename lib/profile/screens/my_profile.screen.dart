import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/initializing.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/profile/screens/me.screen.dart';
import 'package:app/profile/screens/settings.screen.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/pfp.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({super.key});

  static String routeName = '/my_profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final profile = ref.watch(asyncMeProvider);

    void logout() {
      API.auth.deleteToken();
      Navigator.of(context).pushNamedAndRemoveUntil(
        InitializingScreen.routeName,
        (Route<dynamic> route) => false,
      );
    }

    return profile.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (p) => Scaffold(
        backgroundColor: AppAssets.colors.dark,
        body: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(height * 0.4),
                  child: Image.network(
                    assignProfilePicture(p.profilePicture),
                    height: height * 0.2,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '${p.firstName} ${p.lastName}',
                  style: TextStyle(
                    color: AppAssets.colors.light,
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                  ),
                ),
                Text(
                  '@${p.user.username}',
                  style: TextStyle(
                    color: AppAssets.colors.light,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          AppAssets.colors.darkHighlight,
                        ),
                      ),
                      icon: Icon(
                        IconlyBold.edit,
                        color: AppAssets.colors.light,
                      ),
                      onPressed: () => Navigator.of(context).pushNamed(
                        MeScreen.routeName,
                      ),
                      label: Text(
                        'edit profile',
                        style: TextStyle(
                          color: AppAssets.colors.light,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          AppAssets.colors.darkHighlight,
                        ),
                      ),
                      icon: Icon(
                        Icons.settings,
                        color: AppAssets.colors.light,
                      ),
                      onPressed: () => Navigator.of(context).pushNamed(
                        SettingsScreen.routeName,
                      ),
                      label: Text(
                        'settings',
                        style: TextStyle(
                          color: AppAssets.colors.light,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  p.bio!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppAssets.colors.lightHighlight,
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      AppAssets.colors.red,
                    ),
                  ),
                  icon: Icon(
                    IconlyBold.logout,
                    color: AppAssets.colors.light,
                  ),
                  onPressed: () => logout(),
                  label: Text(
                    'logout',
                    style: TextStyle(
                      color: AppAssets.colors.light,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
