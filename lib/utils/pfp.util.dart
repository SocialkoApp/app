import 'package:app/profile/api/models/profile_picture.response.dart';

String assignProfilePicture(ProfilePicture? pfp) {
  if (pfp == null) {
    return 'https://cdn.socialko.cc/assets/default_pfp.png';
  }

  return pfp.url;
}
