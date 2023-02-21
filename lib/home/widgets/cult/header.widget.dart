import 'package:app/cult/api/models/cult.response.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/cult_icon.util.dart';
import 'package:flutter/material.dart';

class CultHeader extends StatelessWidget {
  const CultHeader({super.key, required this.cult});

  final CultResponse cult;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            assignCultIcon(cult.icon),
            width: 55.0,
            height: 55.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cult.name,
              style: TextStyle(
                fontSize: 14,
                color: AppAssets.colors.light,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Members: ${cult.count.members}',
              style: TextStyle(
                fontSize: 12,
                color: AppAssets.colors.lightHighlight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
