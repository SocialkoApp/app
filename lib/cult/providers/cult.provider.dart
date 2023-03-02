import 'package:app/cult/api/map_cult.dart';
import 'package:app/cult/api/models/cult.model.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cult.provider.g.dart';

@riverpod
class AsyncCult extends _$AsyncCult {
  Future<CultModel> _fetchCult() async {
    final cult = await API.cults.getMine();

    return mapCult(cult);
  }

  @override
  FutureOr<CultModel> build() {
    return _fetchCult();
  }

  Future<void> removeUser(String username) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.cults.removeUser(username);

      return _fetchCult();
    });
  }

  Future<void> addUser(String username) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.cults.addUser(username);

      return _fetchCult();
    });
  }
}
