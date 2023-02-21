import 'package:app/utils/api/api.client.dart';

class CultsApi {
  Future<List<dynamic>> get() async {
    final response = await ApiClient.getMany('/cults');

    return response;
  }

  Future<Map<String, dynamic>> getSingle(String name) async {
    final response = await ApiClient.get('/c/$name');

    return response;
  }
}
