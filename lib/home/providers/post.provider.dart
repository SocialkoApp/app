import 'package:app/home/api/map_profile.util.dart';
import 'package:app/home/api/models/post.model.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post.provider.g.dart';

@riverpod
Future<PostModel> post(PostRef ref, String id) async {
  final resp = await API.home.posts.getSingle(id);

  return mapPost(resp);
}
