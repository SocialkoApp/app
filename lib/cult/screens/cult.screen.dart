import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/cult/providers/cult.provider.dart';
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
      error: (err, stack) => ErrorScreen(error: err),
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
                  Image.network(
                    assignCultIcon(cult.icon),
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.cover,
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
                    SizedBox(
                      width: 135.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                            AppAssets.colors.darkHighlight,
                          ),
                        ),
                        onPressed: () => {},
                        child: Row(
                          children: [
                            Icon(
                              IconlyBold.shieldDone,
                              color: AppAssets.colors.light,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              'Ruler Tools',
                              style: TextStyle(
                                color: AppAssets.colors.light,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  // const SizedBox(wid),
                  SizedBox(
                    width: 135.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          AppAssets.colors.darkHighlight,
                        ),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(MembersScreen.routeName),
                      child: Row(
                        children: [
                          Icon(
                            IconlyBold.user3,
                            color: AppAssets.colors.light,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            'Followers',
                            style: TextStyle(
                              color: AppAssets.colors.light,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
