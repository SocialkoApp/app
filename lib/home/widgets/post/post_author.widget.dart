import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class PostAuthor extends StatelessWidget {
  const PostAuthor({
    super.key,
    required this.pfp,
    required this.name,
    required this.role,
  });

  final String pfp;
  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              pfp,
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
                name,
                style: TextStyle(
                  fontSize: 14,
                  color: AppAssets.colors.light,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                role,
                style: TextStyle(
                  fontSize: 12,
                  color: AppAssets.colors.lightHighlight,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
