import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/cult/providers/cult.provider.dart';
import 'package:app/cult/screens/edit_cult.screen.dart';
import 'package:app/cult/screens/join_requests.screen.dart';
import 'package:app/cult/screens/members.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/cult_icon.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CultScreen extends ConsumerWidget {
  const CultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = ref.watch(asyncCultProvider);

    return c.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => const ErrorScreen(error: 'You\'re not in a cult'),
      data: (cult) => Scaffold(
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
                      assignCultIcon(cult.icon),
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
                        cult.name,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: AppAssets.colors.light,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${cult.count.members} Followers',
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
                  if (cult.role == "Ruler")
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          AppAssets.colors.darkHighlight,
                        ),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(EditCultScreen.routeName),
                      child: Icon(
                        IconlyBold.edit,
                        color: AppAssets.colors.light,
                      ),
                    ),
                  if (cult.role == "Ruler")
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
                        'Join Requests',
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
                      'Followers',
                      style: TextStyle(
                        color: AppAssets.colors.light,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                cult.description,
                textAlign: TextAlign.center,
                style: TextStyle(
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
