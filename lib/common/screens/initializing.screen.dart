import 'package:app/utils/api/api.dart';
import 'package:app/home/screens/home.screen.dart';
import 'package:app/auth/screens/login.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class InitializingScreen extends StatelessWidget {
  const InitializingScreen({super.key});

  static String routeName = '/initializing';

  @override
  Widget build(BuildContext context) {
    void redirect(String screen) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(screen, (Route<dynamic> route) => false);
    }

    void checkAuthentication() async {
      if (await API.auth.isLoggedIn()) {
        redirect(HomeScreen.routeName);
      } else {
        redirect(LoginScreen.routeName);
      }
    }

    checkAuthentication();

    return Center(
      child: Image.asset(
        AppAssets.images.logo,
        width: 140.0,
      ),
    );
  }
}
