import 'package:app/home/api/models/image.response.dart';

String assignOrgIcon(ImageResponse? icon) {
  if (icon == null) {
    return 'https://cdn.socialko.cc/assets/default_icon.png';
  }

  return icon.url;
}
