import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CreatePostButton extends StatelessWidget {
  const CreatePostButton({
    super.key,
    required this.onPressedImage,
    required this.onPressedText,
  });

  final Function onPressedImage;
  final Function onPressedText;

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      openButtonHeroTag: 'Open Create New Post',
      closeButtonHeroTag: 'Close Create New Post',
      backgroundColor: AppAssets.colors.primary,
      foregroundColor: AppAssets.colors.light,
      closeButtonStyle: ExpandableFabCloseButtonStyle(
        backgroundColor: AppAssets.colors.primary,
        foregroundColor: AppAssets.colors.light,
      ),
      child: const Icon(IconlyBold.plus),
      children: [
        FloatingActionButton.extended(
          onPressed: () => onPressedImage(),
          heroTag: 'Create Image Post',
          backgroundColor: AppAssets.colors.primary,
          foregroundColor: AppAssets.colors.light,
          icon: const Icon(IconlyBold.image),
          label: const Text('Image'),
        ),
        FloatingActionButton.extended(
          onPressed: () => onPressedText(),
          heroTag: 'Create Text Post',
          backgroundColor: AppAssets.colors.primary,
          foregroundColor: AppAssets.colors.light,
          icon: const Icon(IconlyBold.document),
          label: const Text('Text'),
        ),
      ],
    );
  }
}
