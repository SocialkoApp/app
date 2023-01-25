import 'package:app/auth/api/email.auth.dart';
import 'package:app/auth/api/login.auth.dart';
import 'package:app/auth/api/register.auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class AuthAPI {
  Login login = Login();
  Register register = Register();
  ConfirmEmail email = ConfirmEmail();

  Future<void> saveToken(String token) async {
    await storage.write(
      key: 'token',
      value: token,
    );
  }

  Future<String> getToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<bool> isLoggedIn() {
    return storage.containsKey(key: 'token');
  }

  Future<void> deleteToken() async {
    await storage.deleteAll();
  }
}
