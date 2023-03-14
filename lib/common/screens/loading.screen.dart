import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.colors.dark,
      body: Center(
        child: CircularProgressIndicator(
          color: AppAssets.colors.primary,
        ),
      ),
    );
  }
}
