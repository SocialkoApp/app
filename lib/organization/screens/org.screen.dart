import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/organization/providers/org.provider.dart';
import 'package:app/organization/screens/edit_org.screen.dart';
import 'package:app/organization/screens/join_requests.screen.dart';
import 'package:app/organization/screens/members.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/org_icon.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrgScreen extends ConsumerWidget {
  const OrgScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = ref.watch(asyncOrgProvider);

    String memberCount(int count) {
      if (count == 1) {
        return '$count member';
      }

      return '$count members';
    }

    return c.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) =>
          const ErrorScreen(error: 'you\'re not in an organization'),
      data: (org) => Scaffold(
        backgroundColor: AppAssets.colors.dark,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70.0),
              Row(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppAssets.styles.borderRadius),
                    child: Image.network(
                      assignOrgIcon(org.icon),
                      height: 80.0,
                      width: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        org.name,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: AppAssets.colors.light,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        memberCount(org.count.members),
                        style: TextStyle(
                          color: AppAssets.colors.lightHighlight,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (org.role == "Admin")
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          AppAssets.colors.darkHighlight,
                        ),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(EditOrgScreen.routeName),
                      child: Icon(
                        IconlyBold.edit,
                        color: AppAssets.colors.light,
                      ),
                    ),
                  if (org.role == "Admin")
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          AppAssets.colors.darkHighlight,
                        ),
                      ),
                      icon: Icon(
                        IconlyBold.addUser,
                        color: AppAssets.colors.light,
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(JoinRequestsScreen.routeName),
                      label: Text(
                        'join requests',
                        style: TextStyle(
                          color: AppAssets.colors.light,
                        ),
                      ),
                    ),
                  // const SizedBox(wid),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        AppAssets.colors.darkHighlight,
                      ),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(MembersScreen.routeName),
                    icon: Icon(
                      IconlyBold.user3,
                      color: AppAssets.colors.light,
                    ),
                    label: Text(
                      'members',
                      style: TextStyle(
                        color: AppAssets.colors.light,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                org.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppAssets.colors.lightHighlight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
