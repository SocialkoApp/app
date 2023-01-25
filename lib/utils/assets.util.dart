import 'package:flutter/material.dart';

class AppAssets {
  static AppColors colors = AppColors();
  static AppImages images = AppImages();
  static AppStyles styles = AppStyles();
}

class AppColors {
  Color dark = const Color(0xff171717);
  Color darkHighlight = const Color(0xff252525);

  Color light = const Color(0xffF0F0F0);
  Color lightHighlight = const Color(0xffD1D1D1);

  Color primary = const Color(0xffB810C3);
}

class AppImages {
  String logo = 'assets/logo.png';
}

class AppStyles {
  final double borderRadius = 12.0;

  final inputDecoration = const InputDecoration(
    border: InputBorder.none,
  );

  final inputBoxDecoration = BoxDecoration(
    color: AppAssets.colors.darkHighlight,
    borderRadius: BorderRadius.circular(12.0),
  );
}
