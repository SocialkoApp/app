import 'package:app/utils/api/api.dart';
import 'package:app/home/screens/home.screen.dart';
import 'package:app/auth/screens/login.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class InitializingScreen extends StatelessWidget {
  const InitializingScreen({super.key});

  static String routeName = '/initializing';

  void _checkAuthentication(BuildContext context) async {
    if (!await API.auth.isLoggedIn()) {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAuthentication(context);

    return Center(
      child: Image.asset(
        AppAssets.images.logo,
        width: 140.0,
      ),
    );
  }
}
