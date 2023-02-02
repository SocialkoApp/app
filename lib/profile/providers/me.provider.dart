import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'me.provider.g.dart';

@riverpod
Future<ProfileResponse> me(MeRef ref) async {
  final me = ProfileResponse.fromJson(await API.profile.get.me());

  return me;
}
