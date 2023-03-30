import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class TopText extends StatelessWidget {
  const TopText({
    super.key,
    required this.isInCult,
    required this.hasJoinRequest,
  });

  final bool isInCult;
  final bool hasJoinRequest;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        isInCult
            ? 'feed'
            : hasJoinRequest
                ? 'requested organization'
                : 'organizations',
        style: TextStyle(
          fontSize: 22.0,
          color: AppAssets.colors.light,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
