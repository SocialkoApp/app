import 'dart:io';

import 'package:app/organization/api/map_org.dart';
import 'package:app/organization/api/models/org.model.dart';
import 'package:app/organization/api/models/update_org.dto.dart';
import 'package:app/utils/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'org.provider.g.dart';

@riverpod
class AsyncOrg extends _$AsyncOrg {
  Future<OrganizationModel> _fetchOrg() async {
    final org = await API.orgs.get.mine();

    return mapOrganization(org);
  }

  @override
  FutureOr<OrganizationModel> build() {
    return _fetchOrg();
  }

  Future<void> removeUser(String username) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.orgs.members.remove(username);

      return _fetchOrg();
    });
  }

  Future<void> addUser(String username) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.orgs.members.add(username);

      return _fetchOrg();
    });
  }

  Future<void> acceptRequest(String id) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.orgs.requests.accept(id);

      return _fetchOrg();
    });
  }

  Future<void> declineRequest(String id) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.orgs.requests.decline(id);

      return _fetchOrg();
    });
  }

  Future<void> updateOrg(UpdateOrgDto body) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.orgs.manage.info(body);

      return _fetchOrg();
    });
  }

  Future<void> updateIcon(File file) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await API.orgs.manage.icon(file);

      return _fetchOrg();
    });
  }
}
