import 'package:app/home/api/models/post.model.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class FullTextPost extends StatelessWidget {
  const FullTextPost({super.key, required this.p});

  final PostModel p;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Text(
            p.title ?? '',
            style: TextStyle(
              color: AppAssets.colors.light,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 20.0),
          MarkdownBody(data: p.description ?? ''),
        ],
      ),
    );
  }
}
