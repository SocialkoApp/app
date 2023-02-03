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
    void checkAuthentication() async {
      if (await API.auth.isLoggedIn()) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            LoginScreen.routeName, (Route<dynamic> route) => false);
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
