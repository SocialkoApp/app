import 'package:app/cult/api/get.cults.dart';
import 'package:app/cult/api/members.cult.dart';
import 'package:app/cult/api/requests.cult.dart';
import 'package:app/cult/api/update.cult.dart';

class CultsApi {
  GetCults get = GetCults();
  CultMembers members = CultMembers();
  CultRequests requests = CultRequests();
  UpdateCult update = UpdateCult();
}
