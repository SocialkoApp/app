import 'package:app/utils/api/api.client.dart';

class PostsApi {
  Future<List<dynamic>> get() async {
    final response = await ApiClient.getMany('/posts');

    return response;
  }
}
