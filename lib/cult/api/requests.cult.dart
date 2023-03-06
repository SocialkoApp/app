import 'package:app/utils/api/api.client.dart';

class CultRequests {
  Future<Map<String, dynamic>> create(String id) async {
    final response = await ApiClient.post('/cult/request/$id', null);

    return response;
  }

  Future<void> accept(String id) async {
    await ApiClient.put('/cult/request/accept/$id');
  }

  Future<void> decline(String id) async {
    await ApiClient.put('/cult/request/decline/$id');
  }
}
