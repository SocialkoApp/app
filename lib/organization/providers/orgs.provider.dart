import 'package:app/organization/api/models/org.response.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orgs.provider.g.dart';

@riverpod
class AsyncOrgs extends _$AsyncOrgs {
  Future<List<OrganizationResponse>> _fetchOrgs() async {
    final c = await API.orgs.get.all();

    final List<OrganizationResponse> orgs =
        c.map((e) => OrganizationResponse.fromJson(e)).toList();

    return orgs;
  }

  @override
  FutureOr<List<OrganizationResponse>> build() async {
    return _fetchOrgs();
  }

  Future<void> requestOrgJoin(String id) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.orgs.requests.create(id);

      return _fetchOrgs();
    });
  }
}
