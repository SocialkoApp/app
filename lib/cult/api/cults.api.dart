import 'dart:io';

import 'package:app/cult/api/models/update_cult.dto.dart';
import 'package:app/home/api/models/image.response.dart';
import 'package:app/profile/api/models/profile_picture_update.dto.dart';
import 'package:app/utils/api/api.client.dart';

class CultsApi {
  Future<List<dynamic>> get() async {
    final response = await ApiClient.getMany('/cults');

    return response;
  }

  Future<Map<String, dynamic>> getMine() async {
    final response = await ApiClient.get('/cult');

    return response;
  }

  Future<Map<String, dynamic>> getSingle(String name) async {
    final response = await ApiClient.get('/c/$name');

    return response;
  }

  Future<Map<String, dynamic>> joinRequest(String id) async {
    final response = await ApiClient.post('/cult/request/$id', null);

    return response;
  }

  Future<void> removeUser(String username) async {
    await ApiClient.put('/cult/remove/$username');
  }

  Future<void> addUser(String username) async {
    await ApiClient.put('/cult/add/$username');
  }

  Future<void> updateCult(UpdateCultDto body) async {
    await ApiClient.put('/cult', body.toJson());
  }

  Future<void> updateIcon(File file) async {
    final image =
        ImageResponse.fromJson(await ApiClient.postImage('/files', file));

    final body = ProfilePictureDto(fileId: image.id!);

    await ApiClient.post('/cult/icon', body.toJson());
  }
}
