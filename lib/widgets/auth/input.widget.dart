import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class SocialkoAuthInput extends StatelessWidget {
  const SocialkoAuthInput({
    super.key,
    required this.controller,
    required this.label,
    this.obscured = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String label;
  final bool obscured;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppAssets.styles.inputBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 4.0,
        ),
        child: TextField(
          controller: controller,
          obscureText: obscured,
          cursorColor: AppAssets.colors.lightHighlight,
          decoration: AppAssets.styles.inputDecoration.copyWith(
            hintText: label,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
