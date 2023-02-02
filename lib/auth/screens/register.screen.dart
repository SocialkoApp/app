import 'package:app/utils/api/api.dart';
import 'package:app/auth/api/models/register.dto.dart';
import 'package:app/utils/api/exceptions/bad_request.exception.dart';
import 'package:app/utils/api/exceptions/conflict.exception.dart';
import 'package:app/auth/screens/email_confirmation.screen.dart';
import 'package:app/auth/screens/login.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/auth/widgets/input.widget.dart';
import 'package:app/common/button.widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool passwordObscured = true;

  @override
  void initState() {
    super.initState();
  }

  void _togglePasswordObscure() {
    setState(() {
      passwordObscured = !passwordObscured;
    });
  }

  void _handleRegister(RegisterDto registerDto) async {
    if (_password.text != _confirmPassword.text) {
      _showErrorSnackbar('Passwords do not match');
      return;
    }
    try {
      await API.auth.register.register(registerDto);
      Navigator.of(context)
          .pushReplacementNamed(EmailConfirmationScreen.routeName);
    } on BadRequestException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter all fields'),
        ),
      );
    } on ConflictException catch (e) {
      _showErrorSnackbar(e.message);
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          heightFactor: 1,
          child: Text(message),
        ),
      ),
    );
  }

  void _handleRedirectLogin() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppAssets.colors.dark,
      body: SingleChildScrollView(
        child: SizedBox(
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
                      const SizedBox(height: 30),
                      SocialkoAuthInput(
                        controller: _firstName,
                        label: 'First Name',
                      ),
                      const SizedBox(height: 10.0),
                      SocialkoAuthInput(
                        controller: _lastName,
                        label: 'Last Name',
                      ),
                      const SizedBox(height: 20.0),
                      SocialkoAuthInput(
                        controller: _username,
                        label: 'Username',
                      ),
                      const SizedBox(height: 10.0),
                      SocialkoAuthInput(
                        controller: _email,
                        label: 'Email',
                      ),
                      const SizedBox(height: 20.0),
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
                      const SizedBox(height: 10.0),
                      SocialkoAuthInput(
                        controller: _confirmPassword,
                        label: 'Confirm Password',
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
                      const SizedBox(height: 30.0),
                      SocialkoButton(
                        label: 'Sign Up',
                        width: width * 0.8,
                        height: 55,
                        onPressed: () => _handleRegister(
                          RegisterDto(
                            email: _email.text,
                            username: _username.text,
                            password: _password.text,
                            firstName: _firstName.text,
                            lastName: _lastName.text,
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
                        'Already have an account?',
                        style: TextStyle(
                          color: AppAssets.colors.lightHighlight,
                        ),
                      ),
                      TextButton(
                        onPressed: () => _handleRedirectLogin(),
                        child: Text(
                          'Login',
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
      ),
    );
  }
}
