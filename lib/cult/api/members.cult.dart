import 'package:app/utils/api/api.client.dart';

class CultMembers {
  Future<void> remove(String username) async {
    await ApiClient.put('/cult/remove/$username');
  }

  Future<void> add(String username) async {
    await ApiClient.put('/cult/add/$username');
  }
}
