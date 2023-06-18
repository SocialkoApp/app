import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeInput extends StatelessWidget {
  const MeInput({
    super.key,
    required this.controller,
    required this.helper,
    this.maxLines,
    this.maxLength,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String helper;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

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
          inputFormatters: inputFormatters,
          controller: controller,
          cursorColor: AppAssets.colors.lightHighlight,
          maxLines: maxLines,
          maxLength: maxLength,
          style: TextStyle(
            color: AppAssets.colors.light,
            fontSize: 16.0,
          ),
          decoration: AppAssets.styles.inputDecoration.copyWith(
            labelText: helper,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppAssets.colors.light,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
