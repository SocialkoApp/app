import 'package:app/utils/api/api.client.dart';

class OrganizationMembers {
  Future<void> remove(String username) async {
    await ApiClient.put('/org/remove/$username');
  }

  Future<void> add(String username) async {
    await ApiClient.put('/org/add/$username');
  }
}
