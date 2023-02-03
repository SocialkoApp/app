import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authed.provider.g.dart';

@riverpod
Future<bool> isAuthenticated(IsAuthenticatedRef ref) async {
  final isLoggedIn = await API.auth.isLoggedIn();

  if (isLoggedIn) return true;

  return false;
}
