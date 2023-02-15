import 'dart:io';

import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/profile/api/models/update_profile.dto.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'me.provider.g.dart';

@riverpod
class AsyncMe extends _$AsyncMe {
  Future<ProfileResponse> _fetchMe() async {
    final me = ProfileResponse.fromJson(await API.profile.get.me());

    return me;
  }

  @override
  FutureOr<ProfileResponse> build() async {
    return _fetchMe();
  }

  Future<void> updateProfilePicture(File file) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.profile.update.profilePicture(file);

      return _fetchMe();
    });
  }

  Future<void> updateProfile(UpdateProfileDto body) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.profile.update.details(body);

      return _fetchMe();
    });
  }
}
