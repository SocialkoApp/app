import 'package:app/utils/api/api.client.dart';
import 'package:app/auth/api/models/register.dto.dart';

class Register {
  Future<Map<String, dynamic>> register(RegisterDto registerDto) async {
    final response = await ApiClient.post('/user', registerDto.toJson());

    return response;
  }
}
