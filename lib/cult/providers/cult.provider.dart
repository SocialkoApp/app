import 'dart:io';

import 'package:app/cult/api/map_cult.dart';
import 'package:app/cult/api/models/cult.model.dart';
import 'package:app/cult/api/models/update_cult.dto.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cult.provider.g.dart';

@riverpod
class AsyncCult extends _$AsyncCult {
  Future<CultModel> _fetchCult() async {
    final cult = await API.cults.get.mine();

    return mapCult(cult);
  }

  @override
  FutureOr<CultModel> build() {
    return _fetchCult();
  }

  Future<void> removeUser(String username) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.cults.members.remove(username);

      return _fetchCult();
    });
  }

  Future<void> addUser(String username) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.cults.members.add(username);

      return _fetchCult();
    });
  }

  Future<void> acceptRequest(String id) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.cults.requests.accept(id);

      return _fetchCult();
    });
  }

  Future<void> declineRequest(String id) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.cults.requests.decline(id);

      return _fetchCult();
    });
  }

  Future<void> updateCult(UpdateCultDto body) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.cults.manage.info(body);

      return _fetchCult();
    });
  }

  Future<void> updateIcon(File file) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.cults.manage.icon(file);

      return _fetchCult();
    });
  }
}
