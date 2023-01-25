import 'package:app/utils/api/api.client.dart';
import 'package:app/auth/api/models/send_confirmation_email.dto.dart';

class ConfirmEmail {
  Future<Map<String, dynamic>> sendConfirmationEmail(
      SendEmailConfirmationDto confirmationDto) async {
    final response =
        await ApiClient.put('/email-confirmation', confirmationDto.toJson());

    return response;
  }
}
