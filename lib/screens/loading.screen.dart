import 'package:app/api/api.dart';
import 'package:app/screens/home.screen.dart';
import 'package:app/screens/login.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  static String routeName = '/loading';

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
