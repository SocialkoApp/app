import 'package:app/auth/screens/email_confirmation.screen.dart';
import 'package:app/home/screens/home.screen.dart';
import 'package:app/auth/screens/register.screen.dart';
import 'package:app/home/screens/post.screen.dart';
import 'package:app/profile/screens/me.screen.dart';
import 'package:app/profile/screens/profile.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:app/common/screens/initializing.screen.dart';
import 'package:app/auth/screens/login.screen.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: InitializingScreen.routeName,
      routes: {
        InitializingScreen.routeName: (context) => const InitializingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        PostScreen.routeName: (context) => const PostScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        MeScreen.routeName: (context) => const MeScreen(),
        EmailConfirmationScreen.routeName: (context) =>
            const EmailConfirmationScreen(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppAssets.colors.light,
                displayColor: AppAssets.colors.light,
              ),
        ),
        colorScheme: ColorScheme.dark(
          primary: AppAssets.colors.primary,
          background: AppAssets.colors.dark,
          surface: AppAssets.colors.light,
        ),
      ),
    );
  }
}
