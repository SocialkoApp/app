import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class MeInput extends StatelessWidget {
  const MeInput({
    super.key,
    required this.controller,
    required this.helper,
    this.maxLines,
    this.maxLength,
  });

  final TextEditingController controller;
  final String helper;
  final int? maxLines;
  final int? maxLength;

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
          cursorColor: AppAssets.colors.lightHighlight,
          maxLines: maxLines,
          maxLength: maxLength,
          decoration: AppAssets.styles.inputDecoration.copyWith(
            labelText: helper,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
