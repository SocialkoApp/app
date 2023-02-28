import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/cult/providers/cults.provider.dart';
import 'package:app/home/widgets/cult/cult.widget.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CultsWidget extends ConsumerWidget {
  const CultsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    final c = ref.watch(asyncCultsProvider);

    Widget separator() {
      return const SizedBox(height: 15.0);
    }

    Future<void> joinCult(String id) async {
      await ref.watch(asyncCultsProvider.notifier).requestCultJoin(id);
      ref.invalidate(asyncMeProvider);
    }

    return c.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (cults) => Flexible(
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
                final cult = cults[i];

                return CultWidget(
                  cult: cult,
                  onJoin: () => joinCult(cult.id),
                );
              },
              separatorBuilder: (c, i) => separator(),
              itemCount: cults.length,
            ),
          ),
        ),
      ),
    );
  }
}
