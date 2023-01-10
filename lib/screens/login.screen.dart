import 'package:app/utils/assets.util.dart';
import 'package:app/widgets/auth/input.widget.dart';
import 'package:app/widgets/button.widget.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
                    width: 50.0,
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
                      onPressed: () => {},
                    ),
                  ],
                ),
              )
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
