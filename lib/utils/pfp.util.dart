import 'package:app/profile/api/models/profile_picture.response.dart';

String assignProfilePicture(ProfilePicture? pfp) {
  if (pfp == null) {
    return 'https://s3.eu-central-1.wasabisys.com/socialko/assets/default_pfp.png';
  }

  return pfp.url;
}
