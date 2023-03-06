import 'package:app/utils/api/api.client.dart';

class GetCults {
  Future<List<dynamic>> all() async {
    final response = await ApiClient.getMany('/cults');

    return response;
  }

  Future<Map<String, dynamic>> mine() async {
    final response = await ApiClient.get('/cult');

    return response;
  }

  Future<Map<String, dynamic>> single(String name) async {
    final response = await ApiClient.get('/c/$name');

    return response;
  }
}
