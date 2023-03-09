import 'package:app/common/screens/loading.screen.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/auth/api/models/login.dto.dart';
import 'package:app/auth/api/models/login.response.dart';
import 'package:app/auth/api/models/send_confirmation_email.dto.dart';
import 'package:app/utils/api/exceptions/bad_request.exception.dart';
import 'package:app/utils/api/exceptions/forbidden.exception.dart';
import 'package:app/common/screens/initializing.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/auth/widgets/input.widget.dart';
import 'package:app/common/button.widget.dart';
import 'package:app/utils/snackbar.util.dart';
import 'package:flutter/material.dart';

import 'register.screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _identifier = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool passwordObscured = true;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  void _togglePasswordObscure() {
    setState(() {
      passwordObscured = !passwordObscured;
    });
  }

  void _showResentDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Email sent'),
        content:
            const Text('The confirmation link has been sent to your email'),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  void _handleResendEmailConfirmation(String email) async {
    await API.auth.email
        .sendConfirmationEmail(SendEmailConfirmationDto(email: email));
    _showResentDialog();
  }

  void _handleLogin(LoginDto loginDto) async {
    try {
      setState(() => loading = true);

      LoginResponse response = LoginResponse.fromJson(
        await API.auth.login.login(loginDto),
      );

      await API.auth.saveToken(response.accessToken);
      setState(() => loading = false);

      _redirectLoading();
    } on BadRequestException {
      showSnackbar('Please enter your username and password');
    } on ForbiddenException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppAssets.colors.darkHighlight,
          content: Row(
            children: [
              Text(
                'You didn\'t confirm your email',
                style: TextStyle(
                  color: AppAssets.colors.light,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => _handleResendEmailConfirmation(loginDto.username),
                child: Text(
                  'Resend',
                  style: TextStyle(
                    color: AppAssets.colors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      showSnackbar('An error occurred ${e.toString()}');
    }
  }

  void _redirectLoading() {
    Navigator.of(context).pushReplacementNamed(InitializingScreen.routeName);
  }

  void _handleRedirectRegister() {
    Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
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
                      'Welcome to Socialko',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    SocialkoAuthInput(
                      controller: _identifier,
                      label: 'Username or email',
                    ),
                    const SizedBox(height: 10.0),
                    SocialkoAuthInput(
                      controller: _password,
                      label: 'Password',
                      obscured: passwordObscured,
                      suffixIcon: IconButton(
                        onPressed: _togglePasswordObscure,
                        icon: passwordObscured
                            ? Icon(
                                Icons.visibility,
                                color: AppAssets.colors.lightHighlight,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: AppAssets.colors.lightHighlight,
                              ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ForgotPassword(onPressed: () => {}),
                    ),
                    const SizedBox(height: 20.0),
                    SocialkoButton(
                      label: 'Login',
                      width: width * 0.8,
                      height: 55,
                      onPressed: () => _handleLogin(
                        LoginDto(
                          username: _identifier.text,
                          password: _password.text,
                        ),
                      ),
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
                      'Don\' have an account yet?',
                      style: TextStyle(
                        color: AppAssets.colors.lightHighlight,
                      ),
                    ),
                    TextButton(
                      onPressed: () => _handleRedirectRegister(),
                      child: Text(
                        'Sign Up',
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
