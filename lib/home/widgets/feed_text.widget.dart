import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class FeedText extends StatelessWidget {
  const FeedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        'Feed',
        style: TextStyle(
          fontSize: 22.0,
          color: AppAssets.colors.light,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
