import 'package:app/utils/api/api.client.dart';

class GetProfile {
  Future<Map<String, dynamic>> me() async {
    final response = await ApiClient.get('/profile');

    return response;
  }

  Future<Map<String, dynamic>> profile(String username) async {
    final response = await ApiClient.get('/profile/$username');

    return response;
  }
}
