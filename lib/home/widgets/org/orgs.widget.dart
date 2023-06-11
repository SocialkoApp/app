import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/organization/providers/orgs.provider.dart';
import 'package:app/home/widgets/org/org.widget.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrgsWidget extends ConsumerWidget {
  const OrgsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    final c = ref.watch(asyncOrgsProvider);

    Widget separator() {
      return const SizedBox(height: 15.0);
    }

    Future<void> joinOrganization(String id) async {
      await ref.watch(asyncOrgsProvider.notifier).requestOrgJoin(id);
      ref.invalidate(asyncMeProvider);
    }

    return c.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (orgs) => Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: SizedBox(
          height: height * 0.75,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                final org = orgs[i];

                return OrganizationWidget(
                  org: org,
                  onJoin: () => joinOrganization(org.id),
                );
              },
              separatorBuilder: (c, i) => separator(),
              itemCount: orgs.length,
            ),
          ),
        ),
      ),
    );
  }
}
