import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/organization/providers/org.provider.dart';
import 'package:app/organization/widgets/request.widget.dart';
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

    final c = ref.watch(asyncOrgProvider);

    Widget separator() {
      return const SizedBox(height: 15.0);
    }

    void accept(String id, String firstName, String lastName) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'accept $firstName $lastName',
            style: TextStyle(
              color: AppAssets.colors.light,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'are you sure you would like to accept the user $firstName $lastName into the organization?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('cancel'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
                ref.read(asyncOrgProvider.notifier).acceptRequest(id)
              },
              child: Text(
                'accept',
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
            'decline $firstName $lastName',
            style: TextStyle(
              color: AppAssets.colors.light,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'are you sure you would like to decline the user $firstName $lastName from joining the organization?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('cancel'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
                ref.read(asyncOrgProvider.notifier).declineRequest(id)
              },
              child: Text(
                'decline',
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
      data: (org) => Scaffold(
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
                  if (org.joinRequests == null || org.joinRequests!.isEmpty)
                    Text(
                      'no join requests',
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
                            final request = org.joinRequests![i];

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
                          itemCount: org.joinRequests!.length,
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
