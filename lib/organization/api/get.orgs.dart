import 'package:app/utils/api/api.client.dart';

class GetOrganizations {
  Future<List<dynamic>> all() async {
    final response = await ApiClient.getMany('/orgs');

    return response;
  }

  Future<Map<String, dynamic>> mine() async {
    final response = await ApiClient.get('/org');

    return response;
  }

  Future<Map<String, dynamic>> single(String name) async {
    final response = await ApiClient.get('/o/$name');

    return response;
  }
}
