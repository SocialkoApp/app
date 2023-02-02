import 'package:app/utils/api/api.client.dart';

class PostsApi {
  Future<List<dynamic>> get() async {
    final response = await ApiClient.getMany('/posts');

    return response;
  }

  Future<Map<String, dynamic>> vote(String id, String type) async {
    final response = await ApiClient.put('/posts/$type/$id');

    return response;
  }
}
