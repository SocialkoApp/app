import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class TopText extends StatelessWidget {
  const TopText({super.key, required this.isInCult});

  final bool isInCult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        isInCult ? 'Feed' : 'Cults',
        style: TextStyle(
          fontSize: 22.0,
          color: AppAssets.colors.light,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
