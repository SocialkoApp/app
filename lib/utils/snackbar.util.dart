import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppAssets.colors.dark,
      content: Center(
        heightFactor: 1,
        child: Text(
          message,
          style: TextStyle(
            color: AppAssets.colors.light,
          ),
        ),
      ),
    ),
  );
}
