import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/snackbar.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static String routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    final me = ref.watch(asyncMeProvider);

    void resetPassword(String email) async {
      if (email == 'invalid') {
        return showSnackbar('there was an error');
      }

      await API.auth.login.resetPasword(email);

      showSnackbar('check your email inbox');
    }

    return me.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (m) => Scaffold(
        backgroundColor: AppAssets.colors.dark,
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 45.0),
                  const BackWidget(),
                  const SizedBox(height: 20.0),
                  Text(
                    'settings',
                    style: TextStyle(
                      color: AppAssets.colors.light,
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        AppAssets.colors.darkHighlight,
                      ),
                    ),
                    icon: Icon(
                      IconlyBold.lock,
                      color: AppAssets.colors.light,
                    ),
                    onPressed: () => resetPassword(m.user.email ?? 'invalid'),
                    label: Text(
                      'reset password',
                      style: TextStyle(
                        color: AppAssets.colors.light,
                      ),
                    ),
                  ),
                  // ElevatedButton.icon(
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStatePropertyAll<Color>(
                  //       AppAssets.colors.red,
                  //     ),
                  //   ),
                  //   icon: Icon(
                  //     IconlyBold.delete,
                  //     color: AppAssets.colors.light,
                  //   ),
                  //   onPressed: () => {},
                  //   label: Text(
                  //     'Delete your account',
                  //     style: TextStyle(
                  //       color: AppAssets.colors.light,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
