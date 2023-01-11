import 'package:app/api/api.dart';
import 'package:app/screens/loading.screen.dart';
import 'package:app/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SocialkoButton(
          label: 'Logout',
          width: 250,
          height: 50,
          onPressed: () => {
            API.auth.deleteToken(),
            Navigator.of(context).pushReplacementNamed(
              LoadingScreen.routeName,
            ),
          },
        ),
      ),
    );
  }
}
