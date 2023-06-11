import 'package:app/organization/api/models/org.response.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/org_icon.util.dart';
import 'package:flutter/material.dart';

class OrganizationHeader extends StatelessWidget {
  const OrganizationHeader({super.key, required this.org});

  final OrganizationResponse org;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            assignOrgIcon(org.icon),
            width: 55.0,
            height: 55.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              org.name,
              style: TextStyle(
                fontSize: 14,
                color: AppAssets.colors.light,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Members: ${org.count.members}',
              style: TextStyle(
                fontSize: 12,
                color: AppAssets.colors.lightHighlight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
