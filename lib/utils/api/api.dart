import 'package:app/auth/api/auth.api.dart';
import 'package:app/cult/api/cults.api.dart';
import 'package:app/home/api/home.api.dart';
import 'package:app/profile/api/profile.api.dart';

class API {
  static AuthAPI auth = AuthAPI();
  static ProfileApi profile = ProfileApi();
  static HomeApi home = HomeApi();
  static CultsApi cults = CultsApi();
}
