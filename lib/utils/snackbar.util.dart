import 'package:app/common/globals.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

void showSnackbar(String message) {
  final SnackBar snackBar = SnackBar(
    backgroundColor: AppAssets.colors.darkHighlight,
    content: Center(
      heightFactor: 1,
      child: Text(
        message.toLowerCase(),
        style: TextStyle(
          color: AppAssets.colors.light,
        ),
      ),
    ),
  );

  snackbarKey.currentState?.clearSnackBars();
  snackbarKey.currentState?.showSnackBar(snackBar);
}
