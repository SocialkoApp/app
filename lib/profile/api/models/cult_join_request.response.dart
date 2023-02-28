import 'package:app/cult/api/models/cult.response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cult_join_request.response.g.dart';

@JsonSerializable()
class CultJoinRequest {
  CultJoinRequest({
    required this.cult,
  });

  final CultResponse cult;

  factory CultJoinRequest.fromJson(Map<String, dynamic> json) =>
      _$CultJoinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CultJoinRequestToJson(this);
}
