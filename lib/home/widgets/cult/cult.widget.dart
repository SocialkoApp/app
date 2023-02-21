import 'package:app/cult/api/models/cult.response.dart';
import 'package:app/home/widgets/cult/header.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class CultWidget extends StatelessWidget {
  const CultWidget({super.key, required this.cult});

  final CultResponse cult;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppAssets.styles.borderRadius),
        color: AppAssets.colors.darkHighlight,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CultHeader(cult: cult),
            const SizedBox(height: 10.0),
            Text(
              'Description:',
              style: TextStyle(
                color: AppAssets.colors.light,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              cult.description,
              style: TextStyle(
                color: AppAssets.colors.light,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
