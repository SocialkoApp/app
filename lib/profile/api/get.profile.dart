import 'package:app/utils/api/api.client.dart';

class GetProfile {
  Future<Map<String, dynamic>> me() async {
    final response = await ApiClient.get('/profile');

    return response;
  }
}
