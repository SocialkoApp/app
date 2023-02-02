import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class SocialkoButton extends StatelessWidget {
  const SocialkoButton({
    super.key,
    required this.label,
    required this.width,
    required this.height,
    required this.onPressed,
  }) : super();

  final String label;
  final double width;
  final double height;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppAssets.styles.borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: AppAssets.colors.light,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
