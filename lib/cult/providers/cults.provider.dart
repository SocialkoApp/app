import 'package:app/cult/api/models/cult.response.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cults.provider.g.dart';

@riverpod
class AsyncCults extends _$AsyncCults {
  Future<List<CultResponse>> _fetchCults() async {
    final c = await API.cults.get.all();

    final List<CultResponse> cults =
        c.map((e) => CultResponse.fromJson(e)).toList();

    return cults;
  }

  @override
  FutureOr<List<CultResponse>> build() async {
    return _fetchCults();
  }

  Future<CultResponse> fetchCult(String name) async {
    final resp = await API.cults.get.single(name);

    return CultResponse.fromJson(resp);
  }

  Future<void> requestCultJoin(String id) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.cults.requests.create(id);

      return _fetchCults();
    });
  }
}
