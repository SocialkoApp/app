import 'package:app/home/api/models/add_comment.dto.dart';
import 'package:app/home/api/models/create_post.dto.dart';
import 'package:app/utils/api/api.client.dart';

class PostsApi {
  Future<List<dynamic>> get() async {
    final response = await ApiClient.getMany('/posts');

    return response;
  }

  Future<Map<String, dynamic>> getSingle(String id) async {
    final response = await ApiClient.get('/posts/$id');

    return response;
  }

  Future<Map<String, dynamic>> vote(String id, String type) async {
    final response = await ApiClient.put('/posts/$type/$id');

    return response;
  }

  Future<Map<String, dynamic>> create(CreatePostDto body) async {
    final response = await ApiClient.post('/posts', body.toJson());

    return response;
  }

  Future<void> comment(AddCommentDto body) async {
    await ApiClient.put('/posts/comment', body.toJson());
  }
}
