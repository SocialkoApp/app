import 'package:app/utils/api/api.client.dart';

class OrganizationRequests {
  Future<Map<String, dynamic>> create(String id) async {
    final response = await ApiClient.post('/org/request/$id', null);

    return response;
  }

  Future<void> accept(String id) async {
    await ApiClient.put('/org/request/accept/$id');
  }

  Future<void> decline(String id) async {
    await ApiClient.put('/org/request/decline/$id');
  }
}
