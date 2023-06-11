import 'dart:io';
import 'package:app/organization/api/models/create.dto.dart';
import 'package:app/organization/api/models/update_org.dto.dart';
import 'package:app/home/api/models/image.response.dart';
import 'package:app/profile/api/models/profile_picture_update.dto.dart';
import 'package:app/utils/api/api.client.dart';

class ManageOrganization {
  Future<void> create(String name, String description, File file) async {
    final image =
        ImageResponse.fromJson(await ApiClient.postImage('/files', file));

    final body = CreateOrgDto(
      name: name,
      description: description,
      iconId: image.id!,
    );

    final resp = await ApiClient.post('/org', body.toJson());

    print(resp);
  }

  Future<void> info(UpdateOrgDto body) async {
    await ApiClient.put('/org', body.toJson());
  }

  Future<void> icon(File file) async {
    final image =
        ImageResponse.fromJson(await ApiClient.postImage('/files', file));

    final body = ProfilePictureDto(fileId: image.id!);

    await ApiClient.post('/org/icon', body.toJson());
  }
}
