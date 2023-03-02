import 'dart:io';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/profile/api/models/profile_picture_update.dto.dart';
import 'package:app/profile/api/models/update_profile.dto.dart';
import 'package:app/utils/api/api.client.dart';

class UpdateProfile {
  Future<void> profilePicture(File file) async {
    final image =
        ProfilePicture.fromJson(await ApiClient.postImage('/files', file));

    final body = ProfilePictureDto(fileId: image.id!);

    await ApiClient.post('/profile/profile-picture', body.toJson());
  }

  Future<void> details(UpdateProfileDto body) async {
    await ApiClient.put('/profile', body.toJson());
  }
}
