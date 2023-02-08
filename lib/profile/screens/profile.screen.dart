import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/initializing.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/profile/providers/profile.provider.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/pfp.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static String routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as ProfileArgs;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final profile = ref.watch(profileProvider.call(args.username));

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
                const SizedBox(height: 45.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackWidget(),
                    IconButton(
                      onPressed: () => logout(),
                      icon: Icon(
                        Icons.settings,
                        size: 35.0,
                        color: AppAssets.colors.light,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
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
                Text(
                  p.bio!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppAssets.colors.lightHighlight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileArgs {
  ProfileArgs(this.username);

  final String username;
}
