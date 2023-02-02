import 'package:app/home/widgets/post/actions_row.widget.dart';
import 'package:app/utils/api/api.client.dart';

class PostsApi {
  Future<List<dynamic>> get() async {
    final response = await ApiClient.getMany('/posts');

    return response;
  }

  Future<Map<String, dynamic>> vote(String id, VoteType type) async {
    final response = await ApiClient.put('/posts/${type.name}/$id');

    return response;
  }
}
