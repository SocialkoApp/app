import 'package:app/auth/api/models/forgot_password.dto.dart';
import 'package:app/auth/screens/login.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/auth/api/models/login.dto.dart';
import 'package:app/auth/api/models/login.response.dart';
import 'package:app/auth/api/models/send_confirmation_email.dto.dart';
import 'package:app/utils/api/exceptions/bad_request.exception.dart';
import 'package:app/utils/api/exceptions/forbidden.exception.dart';
import 'package:app/common/screens/initializing.screen.dart';
import 'package:app/utils/api/exceptions/unauthorized.exception.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/auth/widgets/input.widget.dart';
import 'package:app/common/button.widget.dart';
import 'package:app/utils/snackbar.util.dart';
import 'package:flutter/material.dart';

import 'register.screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static String routeName = '/forgot_password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _email = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  void _showSentDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Email sent'),
        content:
            const Text('The reset password link has been sent to your email'),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  void _handleForgot() async {
    try {
      setState(() => loading = true);

      await API.auth.login.resetPasword(_email.text);

      setState(() => loading = false);

      _showSentDialog();
      _redirectLogin();
    } on BadRequestException {
      setState(() => loading = false);
      showSnackbar('Please enter your email');
    } catch (e) {
      setState(() => loading = false);
      showSnackbar('An error occured.');
    }
  }

  void _redirectLogin() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    if (loading) return const LoadingScreen();

    return Scaffold(
      backgroundColor: AppAssets.colors.dark,
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Image.asset(
                    AppAssets.images.logo,
                    width: 40.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'enter your email',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    SocialkoAuthInput(
                      controller: _email,
                      label: 'email',
                    ),
                    const SizedBox(height: 20.0),
                    SocialkoButton(
                      label: 'send reset link',
                      width: width * 0.8,
                      height: 55,
                      onPressed: () => _handleForgot(),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'went the wrong way?',
                      style: TextStyle(
                        color: AppAssets.colors.lightHighlight,
                      ),
                    ),
                    TextButton(
                      onPressed: () => _redirectLogin(),
                      child: Text(
                        'back to login',
                        style: TextStyle(
                          color: AppAssets.colors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Forgot password?',
        style: TextStyle(
          color: AppAssets.colors.lightHighlight,
          // fontSize: 14.0,
        ),
      ),
    );
  }
}
