import 'package:app/home/api/models/image.response.dart';

String assignOrgIcon(ImageResponse? icon) {
  if (icon == null) {
    return 'https://s3.eu-central-1.wasabisys.com/socialko/assets/default_icon.png';
  }

  return icon.url;
}
