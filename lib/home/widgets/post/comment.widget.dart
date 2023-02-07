import 'package:app/home/api/models/comment.model.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/pfp.util.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.c});

  final CommentModel c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              assignProfilePicture(c.author.profilePicture),
              width: 40.0,
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${c.author.firstName} ${c.author.lastName} • ${c.author.user.username}',
                style: TextStyle(
                  color: AppAssets.colors.light,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  c.content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppAssets.colors.light,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
