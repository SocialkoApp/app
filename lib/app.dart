import 'package:app/screens/email_confirmation.screen.dart';
import 'package:app/screens/home.screen.dart';
import 'package:app/screens/register.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/loading.screen.dart';
import 'package:app/screens/login.screen.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoadingScreen.routeName,
      routes: {
        LoadingScreen.routeName: (context) => const LoadingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
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
