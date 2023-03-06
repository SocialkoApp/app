import 'dart:io';

import 'package:app/cult/api/models/update_cult.dto.dart';
import 'package:app/home/api/models/image.response.dart';
import 'package:app/profile/api/models/profile_picture_update.dto.dart';
import 'package:app/utils/api/api.client.dart';

class UpdateCult {
  Future<void> info(UpdateCultDto body) async {
    await ApiClient.put('/cult', body.toJson());
  }

  Future<void> icon(File file) async {
    final image =
        ImageResponse.fromJson(await ApiClient.postImage('/files', file));

    final body = ProfilePictureDto(fileId: image.id!);

    await ApiClient.post('/cult/icon', body.toJson());
  }
}
