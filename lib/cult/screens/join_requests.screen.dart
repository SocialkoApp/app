import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/cult/providers/cult.provider.dart';
import 'package:app/cult/widgets/request.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinRequestsScreen extends ConsumerWidget {
  const JoinRequestsScreen({super.key});

  static String routeName = '/manage_requests';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final c = ref.watch(asyncCultProvider);

    Widget separator() {
      return const SizedBox(height: 15.0);
    }

    void accept(String id, String firstName, String lastName) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Accept $firstName $lastName',
            style: TextStyle(
              color: AppAssets.colors.light,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you would like to accept the user $firstName $lastName into the cult?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
                ref.read(asyncCultProvider.notifier).acceptRequest(id)
              },
              child: Text(
                'Accept',
                style: TextStyle(
                  color: AppAssets.colors.red,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void decline(String id, String firstName, String lastName) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Decline $firstName $lastName',
            style: TextStyle(
              color: AppAssets.colors.light,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you would like to decline the user $firstName $lastName from joining the cult?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
                ref.read(asyncCultProvider.notifier).declineRequest(id)
              },
              child: Text(
                'Decline',
                style: TextStyle(
                  color: AppAssets.colors.red,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return c.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (cult) => Scaffold(
        backgroundColor: AppAssets.colors.dark,
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 45.0),
                  const BackWidget(),
                  const SizedBox(height: 20.0),
                  if (cult.joinRequests == null || cult.joinRequests!.isEmpty)
                    Text(
                      'No join requests',
                      style: TextStyle(
                        color: AppAssets.colors.light,
                      ),
                    )
                  else
                    SizedBox(
                      height: height * 0.8,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.separated(
                          itemBuilder: (context, i) {
                            final request = cult.joinRequests![i];

                            return RequestWidget(
                              profile: request,
                              accept: () => accept(
                                request.id,
                                request.firstName,
                                request.lastName,
                              ),
                              decline: () => decline(
                                request.id,
                                request.firstName,
                                request.lastName,
                              ),
                            );
                          },
                          separatorBuilder: (c, i) => separator(),
                          itemCount: cult.joinRequests!.length,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
