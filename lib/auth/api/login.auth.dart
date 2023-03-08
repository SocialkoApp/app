import 'dart:convert';

import 'package:app/utils/api/api.client.dart';
import 'package:app/auth/api/models/login.dto.dart';

class Login {
  Future<Map<String, dynamic>> login(LoginDto loginDto) async {
    final response = await ApiClient.post('/auth/login', loginDto.toJson());

    return response;
  }

  Future<void> resetPasword(String email) async {
    final body = {
      "email": email,
    };

    await ApiClient.post('/password/reset', body);
  }
}
