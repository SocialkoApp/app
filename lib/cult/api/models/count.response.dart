import 'package:json_annotation/json_annotation.dart';

part 'count.response.g.dart';

@JsonSerializable()
class CountResponse {
  CountResponse({
    required this.members,
  });

  final int members;

  factory CountResponse.fromJson(Map<String, dynamic> json) =>
      _$CountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountResponseToJson(this);
}
