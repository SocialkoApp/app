import 'package:app/organization/api/get.orgs.dart';
import 'package:app/organization/api/members.org.dart';
import 'package:app/organization/api/requests.org.dart';
import 'package:app/organization/api/manage.org.dart';

class OrganizationsApi {
  GetOrganizations get = GetOrganizations();
  OrganizationMembers members = OrganizationMembers();
  OrganizationRequests requests = OrganizationRequests();
  ManageOrganization manage = ManageOrganization();
}
