import 'package:app/profile/api/models/profile.response.dart';

class CommentModel {
  CommentModel({
    required this.author,
    required this.content,
  });

  final ProfileResponse author;
  final String content;
}
