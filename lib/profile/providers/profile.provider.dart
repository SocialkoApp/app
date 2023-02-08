import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile.provider.g.dart';

@riverpod
Future<ProfileResponse> profile(ProfileRef ref, String username) async {
  final profile =
      ProfileResponse.fromJson(await API.profile.get.profile(username));

  return profile;
}
