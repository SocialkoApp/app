import 'package:app/organization/api/models/org.response.dart';
import 'package:app/home/widgets/org/header.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class OrganizationWidget extends StatelessWidget {
  const OrganizationWidget({
    super.key,
    required this.org,
    required this.onJoin,
  });

  final OrganizationResponse org;
  final Function()? onJoin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppAssets.styles.borderRadius),
          color: AppAssets.colors.darkHighlight,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrganizationHeader(org: org),
              const SizedBox(height: 10.0),
              Text(
                'Description:',
                style: TextStyle(
                  color: AppAssets.colors.light,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                org.description,
                style: TextStyle(
                  color: AppAssets.colors.light,
                  fontSize: 16.0,
                ),
              ),
              TextButton(
                onPressed: onJoin,
                child: Text(
                  onJoin == null ? 'Requested' : 'Join',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
