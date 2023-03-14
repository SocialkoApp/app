import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.colors.dark,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            '$error',
            style: TextStyle(
              color: AppAssets.colors.light,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
