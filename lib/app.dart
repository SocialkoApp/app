import 'package:app/auth/screens/email_confirmation.screen.dart';
import 'package:app/auth/screens/forgot_password.screen.dart';
import 'package:app/common/globals.dart';
import 'package:app/common/screens/base.screen.dart';
import 'package:app/organization/screens/create.screen.dart';
import 'package:app/organization/screens/edit_org.screen.dart';
import 'package:app/organization/screens/join_requests.screen.dart';
import 'package:app/organization/screens/members.screen.dart';
import 'package:app/home/screens/create_image_post.screen.dart';
import 'package:app/home/screens/create_text_post.screen.dart';
import 'package:app/auth/screens/register.screen.dart';
import 'package:app/home/screens/post.screen.dart';
import 'package:app/profile/screens/me.screen.dart';
import 'package:app/profile/screens/my_profile.screen.dart';
import 'package:app/profile/screens/profile.screen.dart';
import 'package:app/profile/screens/settings.screen.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: InitializingScreen.routeName,
      scaffoldMessengerKey: snackbarKey,
      routes: {
        InitializingScreen.routeName: (context) => const InitializingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        BaseScreen.routeName: (context) => const BaseScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        MyProfileScreen.routeName: (context) => const MyProfileScreen(),
        MeScreen.routeName: (context) => const MeScreen(),
        PostScreen.routeName: (context) => const PostScreen(),
        CreateTextPost.routeName: (context) => const CreateTextPost(),
        CreateImagePost.routeName: (context) => const CreateImagePost(),
        MembersScreen.routeName: (context) => const MembersScreen(),
        JoinRequestsScreen.routeName: (context) => const JoinRequestsScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        EditOrgScreen.routeName: (context) => const EditOrgScreen(),
        ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
        CreateOrgScreen.routeName: (context) => const CreateOrgScreen(),
        EmailConfirmationScreen.routeName: (context) =>
            const EmailConfirmationScreen(),
      },
      theme: ThemeData(
        useMaterial3: true,
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
